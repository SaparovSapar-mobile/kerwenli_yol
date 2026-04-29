import 'dart:convert';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';

class ImageApiService {
  // image upload --------------------------------------------------------------
  Future<String> imageUpload(ImageParams params) async {
    final Uri uri = Uri.parse(
      '$apiUrl/back/files',
    ).replace(queryParameters: {'file_type': params.fileType});

    // multipart isteği hazırla
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);

    // Dosyayı form-data olarak ekle
    request.files.add(
      await http.MultipartFile.fromPath('file', params.imageFile.path),
    );

    try {
      // İsteği gönder
      final http.StreamedResponse response = await request.send();

      // Cevabı oku
      final String responseBody = await response.stream.bytesToString();

      // JSON verisini çöz
      final dynamic jsonData = json.decode(responseBody);

      // Başarılıysa sonucu dön
      if (response.statusCode == 200 && jsonData['status'] == true) {
        return jsonData['data'] ?? '';
      }

      return '';
    } catch (e) {
      rethrow;
    }
  }
}

class ImageParams extends Equatable {
  final File imageFile;
  final String fileType;

  const ImageParams({required this.imageFile, required this.fileType});

  @override
  List<Object?> get props => [imageFile, fileType];
}

class ImagesParams extends Equatable {
  final List<File> imageFiles;
  final String fileType;

  const ImagesParams({required this.imageFiles, required this.fileType});

  @override
  List<Object?> get props => [imageFiles, fileType];
}
