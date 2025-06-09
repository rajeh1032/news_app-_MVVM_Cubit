import 'package:injectable/injectable.dart';
import 'package:news_app_cubit_mvvm/model/news_response.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/news/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImp implements NewsRepository {
  NewsReomoteDataSource reomoteDataSource;
  NewsRepositoryImp({required this.reomoteDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(
      {required String sourceId, String? query}) {
    return reomoteDataSource.getNewsBySourceId(
        sourceId: sourceId, query: query);
  }
}
