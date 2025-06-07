import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/model/news_response.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/cubit/source_state.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/cubit/news_state.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/cubit/news_view_model_cubit.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/news_bottom_shee.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/news_item.dart';
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
  NewsViewModelCubit viewmodel = NewsViewModelCubit();
  @override
  void initState() {
    super.initState();

    viewmodel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModelCubit, NewsState>(
        bloc: viewmodel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (state is NewsErrorState) {
            Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.headlineMedium,
            );
            ElevatedButton(
              onPressed: () {
                viewmodel.getNewsBySourceId(widget.source.id ?? "");
              },
              child: Text(
                "Try Again",
                style: AppStyles.medium18Black,
              ),
            );
          } else if (state is NewsSuccessState) {
            return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => NewsBottomSheet(
                                news: state.newsList[index],
                              )),
                      child: NewsItem(news: state.newsList[index]));
                });
          }

          return Container();
        });
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
