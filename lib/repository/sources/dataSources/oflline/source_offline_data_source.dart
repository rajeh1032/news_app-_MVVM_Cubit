//todo: interface of offline data source

import 'package:news_app_cubit_mvvm/model/source_response.dart';

abstract class SourceOfflineDataSource {
  Future<SourceResponse?> getSources(String categoryId);
  void saveSources(SourceResponse? sourceResponse, String categoryId);
}
