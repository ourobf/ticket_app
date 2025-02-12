import 'package:flutter/material.dart';
import 'package:tichet_app/base/widgets/text_style_fourth.dart';
import 'package:tichet_app/base/widgets/text_style_third.dart';

class AppColumnTextLayout extends StatelessWidget {
  final String topText;
  final String botomText;
  final CrossAxisAlignment alignment;
  final bool? isColor;
  const AppColumnTextLayout({
    super.key,
    required this.topText,
    required this.botomText,
    required this.alignment,
    this.isColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        TextStyleThird(
          text: topText,
          isColor: isColor,
        ),
        const SizedBox(
          height: 5,
        ),
        TextStyleFourth(
          text: botomText,
          isColor: isColor,
        ),
      ],
    );
  }
}
