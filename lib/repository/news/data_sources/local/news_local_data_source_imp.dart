import 'package:news_app_cubit_mvvm/model/news_response.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/local/news_local_data_source.dart';

class NewsLocalDataSourceImp implements NewsLocalDataSource {@override
  Future<List<NewsResponse>> getNewsBySourceId(String sourceId) {
    // TODO: implement getNewsBySourceId
    throw UnimplementedError();
  }}
