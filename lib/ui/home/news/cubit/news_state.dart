import 'package:news_app_cubit_mvvm/model/news_response.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsState {
  List<News> newsList;
  NewsSuccessState({required this.newsList});
}
