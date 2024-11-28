import 'package:flutter/material.dart';
import 'package:tentwenty/res/colors/app_color.dart';
import 'package:tentwenty/view/widgets/text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.bgColor = AppColor.n4Color,
    this.textColor,
    this.buttonSize = const Size(double.infinity, 56),
    required this.onPressed,
    required this.title,
    this.child,
    this.borderRadius = 15,
    this.isOutlined = false,
    this.borderColor = AppColor.n4Color,
  });

  final Color? bgColor;
  final Size buttonSize;
  final double borderRadius;
  final Color? textColor;
  final VoidCallback onPressed;
  final String title;
  final Widget? child;
  final bool isOutlined;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: buttonSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          side: isOutlined ? BorderSide(color: borderColor, width: 2) : BorderSide.none,
        ),
        backgroundColor: isOutlined ? Colors.transparent : bgColor,
        shadowColor: isOutlined ? Colors.transparent : null,
      ),
      onPressed: onPressed,
      child: isOutlined
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.play_arrow,
                  color: AppColor.whiteColor,
                ),
                const SizedBox(width: 8),
                CustomText(
                  text: title,
                  color: textColor ?? AppColor.whiteColor,
                  size: 16,
                  weight: FontWeight.bold,
                  align: TextAlign.center,
                ),
              ],
            )
          : CustomText(
              text: title,
              color: textColor ?? AppColor.whiteColor,
              size: 16,
              weight: FontWeight.bold,
              align: TextAlign.center,
            ),
    );
  }
}
