import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/about_us.dart';
import 'package:kerwenli_yol/pages/about_us_page/parts/about_us_photos.dart';
import 'package:kerwenli_yol/providers/api/about_us.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class AboutUsTexts extends ConsumerWidget {
  const AboutUsTexts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Text Styles ========
    TextStyle nameStyle = AppTextStyles.bold12;
    TextStyle descStyle = AppTextStyles.regular12;

    AsyncValue<AboutUsModel> resultApi = ref.watch(fetchAboutUsProvider);

    return resultApi.when(
      data: (data) {
        if (data.nameTm == "") {
          return SizedBox.shrink();
        }

        final String name = translateText(
          ref,
          data.nameTm,
          data.nameRu,
          data.nameEn,
        );

        final String desc = translateText(
          ref,
          data.descriptionTm,
          data.descriptionRu,
          data.descriptionEn,
        );

        return Expanded(
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: showImageMethod(data.basePhoto, 10.0, null),
                  ),
                  SizedBox(width: 5),
                  Text(name, style: nameStyle),
                ],
              ),
              SizedBox(height: 5),
              Text(desc, style: descStyle),
              SizedBox(height: 10),
              AboutUsPhotos(photos: data.photos),
            ],
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => loadWidget,
    );
  }
}
