import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
    final TextStyle nameStyle = AppTextStyles.bold12;

    final AsyncValue<AboutUsModel> resultApi = ref.watch(fetchAboutUsProvider);

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return SizedBox.shrink();
        }

        final String name = translateText(
          ref,
          data.nameTm,
          data.nameRu,
          data.nameEn,
          data.nameTr,
        );

        final String desc = translateText(
          ref,
          data.descriptionTm,
          data.descriptionRu,
          data.descriptionEn,
          data.descriptionTr,
        );

        return Expanded(
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // логотипа в ответе сервера нет - без этой проверки
                  // остаётся пустой квадрат 50x50
                  if (data.basePhoto.isNotEmpty) ...[
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: showImageMethod(data.basePhoto, 10.0, null),
                    ),
                    SizedBox(width: 5),
                  ],
                  Flexible(child: Text(name, style: nameStyle)),
                ],
              ),
              SizedBox(height: 5),
              Html(
                data: desc,
                style: {
                  "*": Style(
                    fontWeight: FontWeight.w400,
                    fontSize: FontSize(12),
                    lineHeight: LineHeight.number(1.20),
                    fontFamily: "Rubik",
                  ),
                },
              ),
              if (data.photos.isNotEmpty) ...[
                SizedBox(height: 10),
                AboutUsPhotos(photos: data.photos),
              ],
            ],
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => loadWidget,
    );
  }
}
