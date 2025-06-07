import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({super.key, required this.image, required this.text});
  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.01, vertical: height * 0.01),
      child: Row(
        children: [
          SizedBox(width: width * 0.02),
          Image.asset(image),
          SizedBox(width: width * 0.02),
          Text(
            text,
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
