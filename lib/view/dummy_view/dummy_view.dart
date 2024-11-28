import 'package:flutter/material.dart';
import 'package:tentwenty/res/colors/app_color.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
