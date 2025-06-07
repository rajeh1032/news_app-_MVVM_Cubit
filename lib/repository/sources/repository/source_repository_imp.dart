import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/source_remote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/sources/repository/source_repository.dart';

class SourceRepositoryImp implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImp({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}
