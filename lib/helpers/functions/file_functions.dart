import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:kerwenli_yol/providers/api/search.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
import 'package:kerwenli_yol/providers/parts/file_upload.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getDownloadPath() async {
  if (Platform.isAndroid) {
    final Directory? dir = await getExternalStorageDirectory(); // Android için
    return dir!.path;
  } else if (Platform.isIOS) {
    final Directory dir = await getApplicationDocumentsDirectory(); // iOS için
    return dir.path;
  }
  return '';
}

Future<void> getImageFromFolder(
  WidgetRef ref,
  BuildContext context,
  double ratioX,
  double ratioY,
) async {
  final FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
    // allowedExtensions: ['jpg', 'png', 'jpeg'],
  );

  if (pickedFiles != null) {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFiles.files.single.path!,
      aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
    );

    if (croppedFile != null) {
      final File file = File(croppedFile.path);
      if (context.mounted) {
        await uploadImage(ref, file, context);
      }
    }
  }
}

Future<void> getImageFromCamera(
  WidgetRef ref,
  BuildContext context,
  double ratioX,
  double ratioY,
) async {
  final XFile? pickedFile = await ImagePicker().pickImage(
    source: ImageSource.camera,
  );

  if (pickedFile != null) {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
    );

    if (croppedFile != null) {
      final File file = File(croppedFile.path);
      if (context.mounted) {
        await uploadImage(ref, file, context);
      }
    }
  }
}

Future<void> uploadImage(WidgetRef ref, File file, BuildContext context) async {
  ref.read(loadUploadImageProvider.notifier).state = true;

  try {
    final SearchModel? result = await ref.read(
      visualSearchProvider(file).future,
    );

    ref.read(visualSearchResultProvider.notifier).state = result;
    ref.read(isVisualSearchModeProvider.notifier).state = true;

    // BUNU EKLEYİN
    ref.read(openSearchECommerceHistoryProvider.notifier).state = false;
  } catch (e) {
    rethrow;
  } finally {
    ref.read(loadUploadImageProvider.notifier).state = false;
  }

  if (context.mounted) {
    Navigator.pop(context);
  }
}

// Telin Cache - indaki fayllary arassalamak ucin
Future<void> cleanCacheDirectory() async {
  try {
    final Directory directory = await getTemporaryDirectory();
    final Directory tempDir = Directory(directory.path);

    // Eğer dizin yoksa işlem yapma
    if (!await tempDir.exists()) return;

    // Dizin içindeki tüm dosyaları tek tek sil
    tempDir.listSync().forEach((file) {
      try {
        if (file is File) {
          file.deleteSync();
        } else if (file is Directory) {
          file.deleteSync(recursive: true);
        }
        // ignore: empty_catches
      } catch (e) {}
    });
    // ignore: empty_catches
  } catch (e) {}
}
