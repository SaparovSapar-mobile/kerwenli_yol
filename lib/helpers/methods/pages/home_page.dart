import 'package:flutter/material.dart';

AppBar homePageAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/appbar_logo.png', height: 44),
        Icon(Icons.notifications),
      ],
    ),
  );
}
