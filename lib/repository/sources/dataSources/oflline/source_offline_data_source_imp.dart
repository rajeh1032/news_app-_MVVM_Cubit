import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/oflline/source_offline_data_source.dart';

@Injectable(as: SourceOfflineDataSource)
class SourceOfflineDataSourceImp implements SourceOfflineDataSource {
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    // TODO:  getSources
    var box = await Hive.openBox('SourceTap');
    // var sourceTap =  SourceResponse.fromJson(box.get(categoryId));
    var sourceTap = box.get(categoryId);
    return sourceTap;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String categoryId) async {
    // TODO:  saveSources

    var box = await Hive.openBox('SourceTap');
    //  await box.put(categoryId, sourceResponse?.toJson());

    await box.put(categoryId, sourceResponse);

    await box.close();
  }
}
