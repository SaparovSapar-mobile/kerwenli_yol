import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenLocationListTile extends ConsumerWidget {
  const OpenLocationListTile({super.key, this.text, this.url});

  final String? text;
  final String? url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final bool isLight = isLightTheme(context, ref);
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color leadingIconColor = isLight
        ? LightColors.error
        : DarkColors.error;
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    final TextStyle textStyle = AppTextStyles.regular10;

    return ListTile(
      onTap: () async {
        final String mapUrl = url != null && url!.isNotEmpty
            ? url!
            : 'https://www.google.com/maps/place//@37.955853,58.425542,730m/data=!3m1!1e3!4m6!1m5!3m4!2zMzfCsDU3JzIwLjciTiA1OMKwMjUnMzIuMCJF!8m2!3d37.95575!4d58.4255556';
        await launchUrl(Uri.parse(mapUrl), mode: LaunchMode.externalApplication);
      },
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.asset(
          'assets/images/map_location.png',
          width: 16,
          height: 16,
          color: leadingIconColor,
        ),
      ),
      title: Text(text ?? lang.copyLocation, style: textStyle),
      trailing: Icon(Icons.arrow_outward, size: 16, color: iconColor),
    );
  }
}
