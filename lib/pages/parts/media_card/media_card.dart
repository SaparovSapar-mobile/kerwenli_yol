import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_card/parts/play_media_button.dart';
import 'package:kerwenli_yol/pages/parts/show_video.dart';
import 'package:kerwenli_yol/pages/parts/video_duration.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/services/api/media.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({super.key, required this.media});

  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = AppTextStyles.semiBold10;

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
            'Okuwçylary hem talyplary begendirjek habar',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
