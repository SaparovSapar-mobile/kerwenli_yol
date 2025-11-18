import 'package:flutter/material.dart';

class OnboardPart extends StatelessWidget {
  const OnboardPart({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  final String image, title, desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Image.asset('assets/images/$image', height: 267)],
    );
  }
}
