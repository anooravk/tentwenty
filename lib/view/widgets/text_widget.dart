import 'package:flutter/material.dart';

import '../../res/fonts/app_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.weight,
    this.align = TextAlign.center,
  });

  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: weight,
        fontSize: size,
        fontFamily: AppFonts.poppinsRegular,
        color: color,
      ),
    );
  }
}
