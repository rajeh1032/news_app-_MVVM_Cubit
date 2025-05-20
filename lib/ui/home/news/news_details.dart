import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/news_bottom_shee.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/news_item.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/news_view_model_provider.dart';
import 'package:news_app_cubit_mvvm/utils/app_colors.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';

import 'package:provider/provider.dart';

class NewsDeatils extends StatefulWidget {
  NewsDeatils({required this.source});

  Source source;

  @override
  State<NewsDeatils> createState() => _NewsDeatilsState();
}

class _NewsDeatilsState extends State<NewsDeatils> {
  NewsViewModelProvider viewModel = NewsViewModelProvider();
  @override
  void initState() {
    super.initState();
    viewModel.getNewsL(sourceId: widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child:
          Consumer<NewsViewModelProvider>(builder: (context, viewModel, child) {
        //child is ? widget that can be initialize in consumer and not rebuild or change, will be fixed
        // child = Text(
        //   "Hello",
        //   style: AppStyles.medium16White
        //       .copyWith(color: Theme.of(context).indicatorColor),
        // );
        if (viewModel.errorMessage != null) {
          //todo:error from server
          return Center(
            child: Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: AppStyles.medium16White
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsL(sourceId: widget.source.id ?? "");
                  },
                  child: Text("Try Again",
                      style: AppStyles.medium16White
                          .copyWith(color: Theme.of(context).indicatorColor)),
                ),
              ],
            ),
          );
        }
        if (viewModel.newsList == null) {
          //todo:loading
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),
          );
        }
        return ListView.builder(
            itemCount: viewModel.newsList!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // child!,///call child like this
                  InkWell(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => NewsBottomSheet(
                                news: viewModel.newsList![index],
                              )),
                      child: NewsItem(news: viewModel.newsList![index])),
                ],
              );
            });
      }),
    );
  }
}
/*
FutureBuilder(
        future: ApiManger.getNewsBySourceId(sourceId:  widget.source.id ?? ""),
        builder: (context, snapshot) {
          //todo:if is loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }
          //todo: error client

          else if (snapshot.hasError) {
            Text(
              "SomeThing went wrong",
              style: AppStyles.medium18Black,
            );
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ApiManger.getNewsBySourceId(sourceId: widget.source.id ?? "");
                });
              },
              child: Text(
                "Try Again",
                style: AppStyles.medium18Black,
              ),
            );
          }

          //todo: server => response (success , error)?
          //todo: 1- server => response error

          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!,
                    style: Theme.of(context).textTheme.headlineLarge),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ApiManger.getNewsBySourceId(sourceId: widget.source.id ?? "");
                      });
                    },
                    child: Text(
                      "Try Again",
                      style: AppStyles.medium18Black,
                    ))
              ],
            );
          }

          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => NewsBottomSheet(
                              news: newsList[index],
                            )),
                    child: NewsItem(news: newsList[index]));
              });
        });*/
