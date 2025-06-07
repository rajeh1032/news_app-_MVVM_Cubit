import 'package:news_app_cubit_mvvm/model/news_response.dart';

abstract class NewsLocalDataSource {
  Future<List<NewsResponse>> getNewsBySourceId(String sourceId);
}
