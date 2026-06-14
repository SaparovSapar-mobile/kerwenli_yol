import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/social_type.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail(String email) async {
  final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email);
  try {
    await launchUrl(emailLaunchUri);
  } catch (e) {
    // debugPrint('Cannot launch email: $e');
  }
}

Future<void> launchPhone(String phone) async {
  final Uri telUri = Uri(scheme: 'tel', path: phone);
  try {
    await launchUrl(telUri);
  } catch (e) {
    // debugPrint('Cannot launch phone: $e');
  }
}

Future<void> openSocial(String value, String type) async { // 👈 String type
  String url = value;

  if (!value.startsWith('http')) {
    switch (type) {
      case SocialType.instagram:
        url = 'https://www.instagram.com/$value';
        break;
      case SocialType.tiktok:
        url = 'https://www.tiktok.com/@$value';
        break;
      case SocialType.telegram:
        url = 'https://t.me/$value';
        break;
      case SocialType.whatsapp:
        url = 'https://wa.me/$value';
        break;
      case SocialType.linkedin:
        url = 'https://www.linkedin.com/in/$value';
        break;
      default:
        url = value;
    }
  }

  final Uri socialUri = Uri.parse(url);

  try {
    final bool launched = await launchUrl(
      socialUri,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!launched) {
      await launchUrl(socialUri, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    try {
      await launchUrl(socialUri, mode: LaunchMode.externalApplication);
    } catch (e2) {
      // debugPrint('Cannot launch social: $e2');
    }
  }
}