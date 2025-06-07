//todo: interface ==> repository

import 'package:news_app_cubit_mvvm/model/news_response.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNewsBySourceId(
      {required String sourceId, String? query});
}
