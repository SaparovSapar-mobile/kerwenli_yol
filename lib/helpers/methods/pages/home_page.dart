import 'package:flutter/material.dart';

AppBar homePageAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/appbar_logo.png', height: 44),
        Row(
          children: [
            CircleAvatar(child: Icon(Icons.info)),
            SizedBox(width: 10),
            CircleAvatar(child: Icon(Icons.notifications)),
          ],
        ),
      ],
    ),
  );
}
