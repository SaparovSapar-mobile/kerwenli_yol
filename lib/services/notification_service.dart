import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/services/api/notification.dart';
import 'package:path_provider/path_provider.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  NotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize(BuildContext context) async {
    await _requestPermission();

    if (context.mounted) {
      await _initializeLocalNotifications(context);
    }

    if (context.mounted) {
      await _setupFCMListeners(context);
    }
  }

  /// 1. Bildirim izinlerini al
  Future<void> _requestPermission() async {
    final NotificationSettings settings = await _firebaseMessaging
        .requestPermission(alert: true, badge: true, sound: true);

    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      debugPrint("⚠️ Bildirim izni verilmedi!");
    }
  }

  /// 2. Local notification'ları başlat
  Future<void> _initializeLocalNotifications(BuildContext context) async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    final InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        final String? notificationData = response.payload;

        if (notificationData != null && notificationData.isNotEmpty) {
          // final Map<String, dynamic> data = json.decode(notificationData);
          // final String? dataType = data['data_type'] as String?;
          // final String? dataId = data['data_id'] as String?;

          // if (dataId != null && dataType != null) {
          //   switch (dataType) {
          //     case NotificationDataType.company:
          //       createViewStatistics(
          //         context,
          //         CompanyDetailPage(companyId: dataId),
          //         [
          //           CreateViewDataModel(
          //             dataId: dataId,
          //             type: ViewTypeEnum.company,
          //           ),
          //         ],
          //       );
          //       break;
          //     case NotificationDataType.product:
          //       createViewStatistics(
          //         context,
          //         ProductDetailPage(productId: dataId),
          //         [
          //           CreateViewDataModel(
          //             dataId: dataId,
          //             type: ViewTypeEnum.product,
          //           ),
          //         ],
          //       );
          //       break;
          //     case NotificationDataType.service:
          //       createViewStatistics(
          //         context,
          //         ServiceDetailPage(serviceId: dataId),
          //         [
          //           CreateViewDataModel(
          //             dataId: dataId,
          //             type: ViewTypeEnum.service,
          //           ),
          //         ],
          //       );
          //       break;
          //     default:
          //   }
          // }
        }
      },
    );

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// 3. Topic'e abone ol
  Future<void> subscribeToTopic() async {
    await _firebaseMessaging.subscribeToTopic(notificationTopic);
  }

  /// 4. FCM token'i al (server'a yollamak için)
  Future<String> getDeviceToken() async {
    final String? token = await _firebaseMessaging.getToken();
    return token ?? '';
  }

  /// Регистрация устройства на сервере: POST /admin/notifications/register-token.
  /// Без этого адресные пуши конкретному человеку не доходят - работает
  /// только рассылка на топик. Метод getDeviceToken раньше не вызывался
  /// нигде, то есть токен на сервер не уходил ни разу.
  ///
  /// Вызывать при запуске приложения и после входа в аккаунт.
  /// Разрешение спрашиваем здесь же: без него на iOS и на Android 13+
  /// пуши не придут, каким бы правильным ни был токен.
  Future<void> registerDeviceOnServer(String userUuid) async {
    if (userUuid.isEmpty) return;

    try {
      await _requestPermission();

      final String token = await getDeviceToken();
      if (token.isEmpty) return;

      final String platform = Platform.isIOS ? 'ios' : 'android';
      await NotificationApiService().registerDeviceToken(
        userUuid: userUuid,
        token: token,
        platform: platform,
      );

      // токен может смениться сам - переотправляем новый
      _tokenRefreshSub?.cancel();
      _tokenRefreshSub = _firebaseMessaging.onTokenRefresh.listen((fresh) {
        NotificationApiService().registerDeviceToken(
          userUuid: userUuid,
          token: fresh,
          platform: platform,
        );
      });
    } catch (e) {
      debugPrint('registerDeviceOnServer: $e');
    }
  }

  StreamSubscription<String>? _tokenRefreshSub;

  /// 5. Bildirim listener'ları kur
  Future<void> _setupFCMListeners(BuildContext context) async {
    // Uygulama açıkken gelen bildirim
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showLocalNotification(message);
    });

    // Arkaplanda açıldığında gelen bildirim
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (context.mounted) {
        _handleMessageTap(context, message);
      }
    });

    // Uygulama tamamen kapalıyken açıldığında gelen bildirim
    RemoteMessage? initialMessage = await _firebaseMessaging
        .getInitialMessage();
    if (initialMessage != null && context.mounted) {
      _handleMessageTap(context, initialMessage);
    }
  }

  /// 6. Bildirimi göster
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final androidChannel = AndroidNotificationChannel(
      Random().nextInt(999999).toString(),
      'High Importance Notifications',
      description: 'For important notifications',
      importance: Importance.max,
    );

    // Bildirime resim ekleme (varsa)
    final String? imageUrl =
        message.notification?.android?.imageUrl ?? message.data['image'];
    StyleInformation? styleInformation;
    List<DarwinNotificationAttachment>? attachments;

    if (imageUrl != null) {
      // Api - den surat alynyar
      final http.Response response = await http.get(Uri.parse(imageUrl));

      // Android -da notification surat gorkezmek ucin
      styleInformation = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(response.bodyBytes),
        ),
      );

      // IOS - da notification surat gorkezmek ucin
      // Get temporary directory
      final Directory dir = await getTemporaryDirectory();
      // Create an image name
      final String filename = '${dir.path}/image.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      attachments = [DarwinNotificationAttachment(filename)];
    }

    final androidDetails = AndroidNotificationDetails(
      androidChannel.id,
      androidChannel.name,
      channelDescription: androidChannel.description,
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/launcher_icon',
      styleInformation: styleInformation,
    );

    final DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      attachments: attachments,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Data'yı payload'a string olarak koy
    final String payload = message.data.isNotEmpty
        ? json.encode(message.data)
        : "";

    if (message.notification != null) {
      await _localNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: payload,
      );
    }
  }

  /// 7. Bildirime tıklama işlemleri
  void _handleMessageTap(BuildContext context, RemoteMessage message) {
    // final Map<String, dynamic> data = message.data;
    // final String? dataType = data['data_type'] as String?;
    // final String? dataId = data['data_id'] as String?;

    // if (dataId != null && dataType != null) {
    //   Widget? page;
    //   switch (dataType) {
    //     case NotificationDataType.company:
    //       page = CompanyDetailPage(companyId: dataId);
    //       break;
    //     case NotificationDataType.product:
    //       page = ProductDetailPage(productId: dataId);
    //       break;
    //     case NotificationDataType.service:
    //       page = ServiceDetailPage(serviceId: dataId);
    //       break;
    //     default:
    //   }

    //   goToPage(context, page!, AxisDirection.left);
    // }
  }

  /// Topic - den aboneligi sil
  Future<void> unsubscribeFromTopic() async {
    await _firebaseMessaging.unsubscribeFromTopic(notificationTopic);
  }
}
