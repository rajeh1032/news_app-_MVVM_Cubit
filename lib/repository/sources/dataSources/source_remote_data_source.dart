//todo:interface => remote data source(online)
import 'package:news_app_cubit_mvvm/model/source_response.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSources(String categoryId);
}









//todo:interface => local data source(offline -- hive)
// abstract class SourceOfflineDataSource {}
