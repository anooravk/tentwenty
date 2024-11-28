import 'package:flutter/material.dart';

import '../../../res/colors/app_color.dart';
import '../../res/fonts/app_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.isObsecure,
      this.fillColor,
      this.hasPrefixIcon,
      this.onChanged,
      this.hasSuffixOnTap,
      this.onSubmitted,
      this.hasPrefixOnTap,
      this.isReadOnly,
      this.maxLines,
      this.hintStyle,
      this.cursorColor,
      this.hasSuffixIcon,
      this.isNumericKeyboard = false,
      this.onTap})
      : assert(isObsecure == null || hasSuffixIcon != null || hasSuffixOnTap != null, 'isObsecure or hasSuffixIcon must be provided');

  String? hintText;
  TextEditingController controller;
  bool? isObsecure;
  String? hasPrefixIcon;
  String? hasSuffixIcon;
  bool? isReadOnly;
  VoidCallback? hasSuffixOnTap;
  Function(String)? onSubmitted;
  VoidCallback? hasPrefixOnTap;
  VoidCallback? onTap;
  bool isNumericKeyboard;
  Function(String)? onChanged;
  Color? fillColor;
  Color? cursorColor;
  TextStyle? hintStyle;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      cursorColor: cursorColor ?? AppColor.blackColor,
      obscureText: isObsecure ?? false,
      readOnly: isReadOnly ?? false,
      maxLines: maxLines ?? 1,
      keyboardType: isNumericKeyboard ? const TextInputType.numberWithOptions(decimal: false, signed: true) : null,
      style: TextStyle(
        color: cursorColor ?? AppColor.blackColor,
        fontSize: 14,
        fontFamily: AppFonts.poppinsRegular,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Field Required*";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: hasPrefixIcon != null
            ? GestureDetector(
                onTap: hasPrefixOnTap,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    hasPrefixIcon!,
                    height: 20,
                  ),
                ),
              )
            : null,
        suffixIcon: hasSuffixIcon != null
            ? GestureDetector(
                onTap: hasSuffixOnTap,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    hasSuffixIcon!,
                    height: 20,
                  ),
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: hintStyle ??
            const TextStyle(
              color: AppColor.n3Color,
              fontSize: 12,
              fontFamily: AppFonts.poppinsRegular,
            ),
        filled: true,
        fillColor: fillColor ?? AppColor.n10Color,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor ?? AppColor.n10Color, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor ?? AppColor.n10Color, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor ?? AppColor.n10Color, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
