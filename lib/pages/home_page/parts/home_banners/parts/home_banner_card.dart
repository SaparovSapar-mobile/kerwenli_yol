import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/send.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/banner.dart';

class HomeBannerCard extends ConsumerWidget {
  const HomeBannerCard({super.key, required this.banner});

  final BannerModel banner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String image = translateText(
      ref,
      banner.imageTm,
      banner.imageRu,
      banner.imageEn,
      banner.imageEn,
    );

    return GestureDetector(
      onTap: () async {
        await openSocial(banner.url);
      },
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: showImageMethod(image, 0, BoxFit.cover),
      ),
    );
  }
}
