import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/news_page_shimmer.dart';
import 'package:kerwenli_yol/pages/parts/show_date.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/providers/api/news.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailPage extends ConsumerWidget {
  const NewsDetailPage({super.key, required this.newsId});

  final String newsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ============= Colors ===========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ============= Text Styles ===========
    final TextStyle titleStyle = AppTextStyles.medium16;

    final AsyncValue<NewsModel> resultApi = ref.watch(
      fetchNewsDetailProvider(newsId),
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
          );
          final String description = translateText(
            ref,
            data.descriptionTm,
            data.descriptionRu,
            data.descriptionEn,
          );

          return Column(
            children: [
              InternetStatusBar(),
              CompanyPageTop(
                text: 'Tazelik',
                onPressed: () {},
                showBottomLine: false,
              ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CompanyCardImage(
                            cardTopTypes: [CardTopTextType.news],
                            height: 184,
                            width: double.maxFinite,
                            forBookMark: true,
                            cttSize: 12,
                            cttTopPosition: -16,
                            image: data.coverImage,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 58.902442932128906,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => SizedBox(
                                height: 58.902442932128906,
                                width: 105,
                                child: showImageMethod(
                                  data.galleryImages[index],
                                  3.2,
                                  null,
                                ),
                              ),
                              separatorBuilder: (_, _) => SizedBox(width: 6),
                              itemCount: data.galleryImages.length,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 6),
                            child: Text(name, style: titleStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ViewCount(
                                fontSize: 10,
                                viewCount: data.viewsCount,
                              ),
                              ShowDate(date: data.updatedAt, fontSize: 10),
                            ],
                          ),
                          SizedBox(height: 10),
                          Html(
                            data: description,
                            style: {
                              "*": Style(
                                fontWeight: FontWeight.w400,
                                fontSize: FontSize(12),
                                lineHeight: LineHeight.number(1.20),
                                fontFamily: "Rubik",
                              ),
                            },
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
