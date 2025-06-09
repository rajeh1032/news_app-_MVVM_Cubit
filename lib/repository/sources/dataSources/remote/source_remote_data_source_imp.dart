import 'package:injectable/injectable.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/remote/source_remote_data_source.dart';
@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImp implements SourceRemoteDataSource {
  ApiManger apiManger;
  SourceRemoteDataSourceImp({required this.apiManger});
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManger.getSources(categoryId);
    return response;
  }
}


