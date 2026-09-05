import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_card/parts/play_media_button.dart';
import 'package:kerwenli_yol/pages/parts/show_video.dart';
import 'package:kerwenli_yol/pages/parts/video_duration.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/services/api/media.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class MediaCard extends ConsumerWidget {
  const MediaCard({super.key, required this.media});

  final MediaModel media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle textStyle = AppTextStyles.semiBold10;

    final String categoryName = translateText(
      ref,
      media.categoryName.tm,
      media.categoryName.ru,
      media.categoryName.en,
      media.categoryName.en,
    );
    final String subcategoryNames = media.subcategories
        .map(
          (e) => translateText(ref, e.nameTm, e.nameRu, e.nameEn, e.nameTr),
        )
        .where((e) => e.isNotEmpty)
        .join(', ');
    final String title = [
      categoryName,
      subcategoryNames,
    ].where((e) => e.isNotEmpty).join(' • ');

    return GestureDetector(
      onTap: () {
        MediaApiService().fetchMedia(media.id);
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) =>
                ShowVideo(videoUrl: media.videoPaths.first, autoPlay: true),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: mediaCardImageHeight,
                    child: showImageMethod(media.coverImage, 8, null),
                  ),
                  PlayMediaButton(),
                  Positioned(
                    left: 6,
                    right: 6,
                    bottom: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ViewCount(viewCount: media.viewNumber,), VideoDuration()],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
