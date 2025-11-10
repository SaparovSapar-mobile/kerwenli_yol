import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.asset(homeBanners.first, fit: BoxFit.cover),
    );
  }
}
