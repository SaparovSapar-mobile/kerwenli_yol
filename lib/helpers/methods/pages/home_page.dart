import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/models/weather.dart';
import 'package:kerwenli_yol/providers/api/weather.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

AppBar homePageAppBar(BuildContext context) {
  String getCurrentDate() {
    return DateFormat('dd.MM.yyyy').format(DateTime.now());
  }

  return AppBar(
    leading: null,
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(16),
      child: Consumer(
        builder: (context, ref, widget) {
          // ========== Colors ===========
          final bool isLight = isLightTheme(context, ref);
          final Color bgColor = isLight
              ? LightColors.bgBlogLight
              : DarkColors.bgBlogDark;

          // ========== Text Styles ===========
          final TextStyle dateStyle = AppTextStyles.medium12;

          final String appBarLogo = isLight
              ? 'appbar_logo.png'
              : 'dark_appbar_logo.png';

          return Container(
            padding: EdgeInsets.only(left: 16, top: 10, right: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/$appBarLogo',
                      height: 29,
                      width: 72,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${getCurrentDate()} | ', style: dateStyle),
                        Image.asset(
                          "assets/icon/cloud.png",
                          width: 14,
                          height: 14,
                        ),
                        // Text(' 13° Ашхабад', style: dateStyle),
                        WeatherPart(dateStyle: dateStyle),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                AppBarBottomLine(thickness: 2),
              ],
            ),
          );
        },
      ),
    ),
  );
}

class WeatherPart extends ConsumerWidget {
  const WeatherPart({super.key, required this.dateStyle});

  final TextStyle dateStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<WeatherModel> resultApi = ref.watch(weatherProvider);
    return resultApi.when(
      data: (data) {
        final temp = data.temperature.round();
        return Text(' $temp° ${data.cityName}', style: dateStyle);
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => LoadingAnimationWidget.staggeredDotsWave(
        color: LightColors.primary,
        size: 12,
      ),
    );
  }
}
