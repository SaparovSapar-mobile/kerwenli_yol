import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeMedia extends StatelessWidget {
  const HomeMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Media', onTap: () {}),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: HomeMediaList(),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
