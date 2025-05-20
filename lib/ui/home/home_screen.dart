import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/model/my_category.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/source_details.dart';
import 'package:news_app_cubit_mvvm/ui/home/drawer/home_drawer.dart';
import 'package:news_app_cubit_mvvm/ui/home/home_category/home_category_fragment.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/search_screen.dart';
import 'package:news_app_cubit_mvvm/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          selectedCategory == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      //todo add search screen
                      Navigator.pushNamed(context, SearchScreen.routeName);
                    },
                    icon: Icon(
                        size: 25,
                        color: Theme.of(context).indicatorColor,
                        Icons.search),
                  ),
                )
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(
          onDrawerMenueClick: onDrawerClick,
        ),
      ),
      body: selectedCategory == null
          ? CategoryFragment.HomeCategoryFragment(
              onButtonClick: onCategoryClick,
            )
          : SourceDetails(
              category: selectedCategory!,
            ),
    );
  }

  MyCategory? selectedCategory;

  void onCategoryClick(MyCategory newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  onDrawerClick() {
    selectedCategory = null;
    setState(() {});
  }
}
