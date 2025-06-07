import 'package:news_app_cubit_mvvm/model/source_response.dart';

abstract class SourceRepository {
  Future<SourceResponse?> getSources(String categoryId);
}
