//todo: viewModel => object Repository
//todo: Repository => object RemoteDataSource
//todo: RemoteDataSource => object ApiManger
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source_imp.dart';
import 'package:news_app_cubit_mvvm/repository/news/repository/news_repository.dart';
import 'package:news_app_cubit_mvvm/repository/news/repository/news_repository_imp.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/source_remote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/source_remote_data_source_imp.dart';
import 'package:news_app_cubit_mvvm/repository/sources/repository/source_repository.dart';
import 'package:news_app_cubit_mvvm/repository/sources/repository/source_repository_imp.dart';

SourceRepository injectSourceRepository() {
  return SourceRepositoryImp(remoteDataSource: injectSourceRemoteDataSource());
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImp(apiManger: injectApiManger());
}

ApiManger injectApiManger() {
  return ApiManger();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImp(reomoteDataSource: injectNewsRemoteDataSource());
}

NewsReomoteDataSource injectNewsRemoteDataSource() {
  return NewsReomoteDataSourceImp.NewsRemoteDataSourceImp(
      apiManger: injectApiManger());
}
