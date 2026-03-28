import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/contact_us.dart';
import 'package:kerwenli_yol/services/api/contact_us.dart';

final Provider<ContactUsApiService> contactUsApiProvider =
    Provider<ContactUsApiService>((ref) => ContactUsApiService());

final AutoDisposeFutureProvider<ContactUsModel> fetchContactUsProvider =
    FutureProvider.autoDispose<ContactUsModel>((ref) async {
      ContactUsModel result = ContactUsModel.defaultValue();

      try {
        result = await ref.read(contactUsApiProvider).fetchContactUs();
      } catch (e) {
        rethrow;
      }
      return result;
    });
