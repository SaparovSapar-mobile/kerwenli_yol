import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/parts/home_top_categories_button.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/parts/home_top_notification_button.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/parts/home_top_profile_button.dart';

class HomePageTop extends ConsumerWidget {
  const HomePageTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 7.5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeTopCategoriesButton(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeTopNotificationButton(),
              SizedBox(width: 6),
              HomeTopProfileButton(),
            ],
          ),
        ],
      ),
    );
  }
}
