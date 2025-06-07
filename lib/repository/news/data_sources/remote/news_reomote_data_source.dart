import 'package:news_app_cubit_mvvm/model/news_response.dart';

abstract class NewsReomoteDataSource {
  Future<NewsResponse?> getNewsBySourceId(
      {required String sourceId, String? query});
}
