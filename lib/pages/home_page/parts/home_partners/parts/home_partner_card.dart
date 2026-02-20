import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomePartnerCard extends StatelessWidget {
  const HomePartnerCard({super.key, this.isFirst, this.isLast});

  final bool? isFirst, isLast;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = AppTextStyles.semiBold10;

    return GestureDetector(
      onTap: () =>
          goToPage(context, CompanyPage(companyId: ''), AxisDirection.left),
      child: Container(
        width: 170,
        margin: isFirst != null && isLast != null
            ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
            : null,
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            SizedBox(
              width: 43,
              height: 43,
              child: ShowImage(image: 'assets/examples/partner_example.png'),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                'Türkmenistanyň Senagatçylar we Telekeçiler Birleşmesi',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
