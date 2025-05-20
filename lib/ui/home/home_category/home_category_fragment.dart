import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:news_app_cubit_mvvm/model/my_category.dart';
import 'package:news_app_cubit_mvvm/utils/app_colors.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment.HomeCategoryFragment({required this.onButtonClick});
  Function onButtonClick;
  List<MyCategory> categoryList = [];
  @override
  Widget build(BuildContext context) {
    //todo:add povider of theme mode here
    categoryList = MyCategory.getCatogryList(isDark: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning\nHere is Some News For You",
              style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              itemCount: categoryList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: height * 0.02);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    alignment: index % 2 == 1
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    children: [
                      Image.asset(categoryList[index].image),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(84),
                            color: AppColors.greyColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * 0.001,
                            ),
                            Text(
                              "View All",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            IconButton(
                              iconSize: 30,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor),
                              onPressed: () {
                                //todo: goto category details
                                onButtonClick(categoryList[index]);
                              },
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              color: Theme.of(context).indicatorColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
