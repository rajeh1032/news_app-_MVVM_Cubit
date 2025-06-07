import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/utils/app_colors.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';

class LanguageThemeBootomSheet extends StatelessWidget {
  String text;
  LanguageThemeBootomSheet({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.whiteColor, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyles.medium20White,
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: AppColors.whiteColor,
            size: 35,
          )
        ], 
      ),
    );
  }
}
