import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';

typedef MyValidator = String? Function(String?);

class CustomTextField extends StatelessWidget {
  final Color? borderColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLine;
  final TextEditingController? controller;
  final MyValidator? validator;
  TextInputType keyboardType;
  bool obscureText;
  String? obscuringCharacter;
  void Function(String)? onChanged;

  CustomTextField(
      {super.key,
      this.borderColor,
      this.hintText,
      this.hintStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.labelStyle,
      this.maxLine,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.obscuringCharacter,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).indicatorColor,
      ),
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? "*",
      validator: validator,
      maxLines: maxLine ?? 1,
      controller: controller,
      cursorColor: Theme.of(context).indicatorColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).indicatorColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).indicatorColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).indicatorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).indicatorColor, width: 1),
        ),
        hintText: hintText,
        hintStyle: hintStyle ??
            AppStyles.medium16Grey.copyWith(
              color: Theme.of(context).indicatorColor,
            ),
        labelText: labelText,
        labelStyle: labelStyle ??
            AppStyles.medium16Grey.copyWith(
              color: Theme.of(context).indicatorColor,
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
