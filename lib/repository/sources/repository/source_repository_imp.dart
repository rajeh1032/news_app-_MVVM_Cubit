import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/oflline/source_offline_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/remote/source_remote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/sources/repository/source_repository.dart';

class SourceRepositoryImp implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceOfflineDataSource offlineDataSource;
  SourceRepositoryImp(
      {required this.remoteDataSource, required this.offlineDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //todo: internt ==> remote
      var sourceResponse = await remoteDataSource.getSources(categoryId);

      //todo: save sources in local
      offlineDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    }
    //todo: offline ==> local (hive)

    var sourceResponse = await offlineDataSource.getSources(categoryId);

    return sourceResponse;
  }
}
