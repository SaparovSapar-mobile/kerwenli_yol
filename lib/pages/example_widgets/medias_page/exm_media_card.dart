import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_card/parts/play_media_button.dart';
import 'package:kerwenli_yol/pages/parts/video_duration.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ExmMediaCard extends StatelessWidget {
  const ExmMediaCard({super.key, required});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = AppTextStyles.semiBold10;

    return Column(
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
                  height: 202,
                  child: ShowImage(image: 'assets/examples/media_example.jpg'),
                ),
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
    );
  }
}
