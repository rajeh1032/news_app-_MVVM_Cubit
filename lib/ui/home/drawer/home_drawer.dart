import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/ui/home/drawer/langauge_theme_bottom_sheet.dart';
import 'package:news_app_cubit_mvvm/utils/app_asset.dart';
import 'package:news_app_cubit_mvvm/utils/app_colors.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';

import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerMenueClick;
  HomeDrawer({required this.onDrawerMenueClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.25,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Text(
            "News App",
            style: AppStyles.bold24Black,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.01, vertical: height * 0.01),
          child: Row(
            children: [
              SizedBox(width: width * 0.02),
              Image.asset(AppAsset.home_dark),
              SizedBox(width: width * 0.02),
              TextButton(
                child: Text(
                  "Home",
                  style: AppStyles.bold20White,
                ),
                onPressed: () {
                  //todo=> goto home
                  onDrawerMenueClick();

                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        Divider(
          indent: width * 0.04,
          endIndent: width * 0.04,
          color: AppColors.whiteColor,
        ),
        DrawerItem(
          text: "Theme",
          image: AppAsset.theme_dark,
        ),
        LanguageThemeBootomSheet(text: 'Dark'),
        Divider(
          indent: width * 0.04,
          endIndent: width * 0.04,
          color: AppColors.whiteColor,
        ),
        DrawerItem(
          text: "Language",
          image: AppAsset.earth_dark,
        ),
        LanguageThemeBootomSheet(text: 'English'),
      ],
    );
  }
}
