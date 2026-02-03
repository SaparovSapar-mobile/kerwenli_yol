import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/parts/show_date.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class NewsDetailPage extends ConsumerWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ============= Colors ===========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ============= Text Styles ===========
    TextStyle titleStyle = AppTextStyles.medium16;
    TextStyle descStyle = AppTextStyles.regular12;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: Column(
        children: [
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
                    children: [
                      CompanyCardImage(
                        cardTopTypes: [CardTopTextType.news],
                        height: 184,
                        width: double.maxFinite,
                        forBookMark: true,
                        cttSize: 12,
                        cttTopPosition: -16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 6),
                        child: Text(
                          'Türkmenistanda öndürilen şokaladly süýji we lomay harytlar',
                          style: titleStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ViewCount(fontSize: 8), ShowDate()],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: HomeVipCompanyCardCategories(
                          iconSize: 12,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      Text(
                        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at HampdenContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden... Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at HampdenContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden... Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at HampdenContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden...',
                        style: descStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
