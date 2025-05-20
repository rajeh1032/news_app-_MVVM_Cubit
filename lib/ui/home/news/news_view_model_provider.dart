import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/model/news_response.dart';

class NewsViewModelProvider extends ChangeNotifier {
  List<News>? newsList = [];
  String? errorMessage;
  void getNewsL({required String sourceId}) async {
    //todo:reinitialize
    newsList = null;
    errorMessage = null;
    notifyListeners();

    try {
      NewsResponse? response =
          await ApiManger.getNewsBySourceId(sourceId: sourceId);
      if (response?.status != 'ok') {
        //todo :error form server
        errorMessage = "error form server";
      } else {
        newsList = response!.articles!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
