import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/di/di.dart';
import 'package:news_app_cubit_mvvm/di/di_inject.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source_imp.dart';
import 'package:news_app_cubit_mvvm/repository/news/repository/news_repository.dart';
import 'package:news_app_cubit_mvvm/repository/news/repository/news_repository_imp.dart';
import 'package:news_app_cubit_mvvm/widget/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late NewsRepository newsRepository = getIt<NewsRepository>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.04),
      child: Column(
        children: [
          SizedBox(
              height: height * 0.1,
              width: double.infinity,
              child: CustomTextField(
                suffixIcon: Icon(
                    size: 25,
                    color: Theme.of(context).indicatorColor,
                    Icons.search),
                onChanged: (data) async {
                  var response = await newsRepository.getNewsBySourceId(
                      sourceId: 'ABC News', query: data);
                },
              )),
          // Expanded(child: )
        ],
      ),
    ));
  }
}
