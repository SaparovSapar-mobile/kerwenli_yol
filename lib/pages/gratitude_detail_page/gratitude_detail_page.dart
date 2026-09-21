import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/gratitude.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/news_page_shimmer.dart';
import 'package:kerwenli_yol/pages/parts/show_date.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/providers/api/gratitude.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:flutter_html/flutter_html.dart';

class GratitudeDetailPage extends ConsumerWidget {
  const GratitudeDetailPage({
    super.key,
    required this.gratitudeId,
    required this.viewsCount,
  });

  final String gratitudeId;
  final int viewsCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ============= Colors ===========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color borderColor = Color(0xFFE1E1E1);

    // ============= Text Styles ===========
    final TextStyle nameStyle = AppTextStyles.semiBold16;

    final AsyncValue<GratitudeModel> resultApi = ref.watch(
      fetchGratitudeDetailProvider(gratitudeId),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: resultApi.when(
        data: (data) {
          if (data.id == '') {
            return Center(child: Text('No data'));
          }

          final String name = translateText(
            ref,
            data.nameTm,
            data.nameRu,
            data.nameEn,
            data.nameEn,
          );
          final String description = translateText(
            ref,
            data.descriptionTm,
            data.descriptionRu,
            data.descriptionEn,
            data.descriptionEn,
          );

          return Column(
            children: [
              InternetStatusBar(),
              CompanyPageTop(
                companyId: gratitudeId,
                text: lang.acknowledgements,
                onPressed: () {},
                showBottomLine: false,
                leftPadding: 0,
              ),
              SizedBox(height: 6),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: bgColor,
                    padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 26, right: 10),
                      decoration: BoxDecoration(
                        color: innerBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 124.19668579101562,
                                width: 124.19668579101562,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.81),
                                  border: Border.all(color: borderColor),
                                ),
                                child: showImageMethod(data.coverImg, 6, null),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ViewCount(fontSize: 10, viewCount: viewsCount),
                              ShowDate(date: data.createdAt, fontSize: 10),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text(name, style: nameStyle),
                              SizedBox(height: 14),
                              Html(
                                data: description,
                                style: {
                                  "*": Style(
                                    fontWeight: FontWeight.w400,
                                    fontSize: FontSize(14),
                                    lineHeight: LineHeight.number(1.20),
                                    fontFamily: "Rubik",
                                  ),
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        },
        error: (_, _) => const SizedBox.shrink(),
        loading: () => NewsPageShimmer(),
      ),
    );
  }
}
