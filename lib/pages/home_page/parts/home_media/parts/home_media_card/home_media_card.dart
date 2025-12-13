import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_card/parts/play_media_button.dart';
import 'package:kerwenli_yol/pages/parts/video_duration.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({super.key, this.isFirst, this.isLast});

  final bool? isFirst, isLast;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = AppTextStyles.semiBold10;

    return Container(
      width: 98,
      margin: isFirst != null && isLast != null
          ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ShowImage(image: 'assets/examples/media_example.jpg'),
                  PlayMediaButton(),
                  Positioned(
                    left: 6,
                    right: 6,
                    bottom: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ViewCount(), VideoDuration()],
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
