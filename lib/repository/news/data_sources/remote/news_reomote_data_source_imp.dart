import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/model/news_response.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source.dart';

class NewsReomoteDataSourceImp implements NewsReomoteDataSource {
  ApiManger apiManger;
  NewsReomoteDataSourceImp.NewsRemoteDataSourceImp({required this.apiManger});
  @override
  Future<NewsResponse?> getNewsBySourceId(
      {required String sourceId, String? query}) async {
    var response =
        await apiManger.getNewsBySourceId(sourceId: sourceId, query: query);

    return response;
  }
}
