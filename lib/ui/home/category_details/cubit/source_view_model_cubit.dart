import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/source_remote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/sources/dataSources/source_remote_data_source_imp.dart';
import 'package:news_app_cubit_mvvm/repository/sources/repository/source_repository.dart';
import 'package:news_app_cubit_mvvm/repository/sources/repository/source_repository_imp.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/cubit/source_state.dart';

//لازم اعمل وراثه بيورث كل حاجه ماعدا ال constructor
class SourceViewModelCubit extends Cubit<SourceState> {
  late SourceRepository sourceRepository;
  late SourceRemoteDataSource remoteDataSource;
  late ApiManger apiManger;

  //todo :intial state
  SourceViewModelCubit() : super(SourceLoadingState()) {
    apiManger = ApiManger();
    remoteDataSource = SourceRemoteDataSourceImp(apiManger: apiManger);
    sourceRepository = SourceRepositoryImp(remoteDataSource: remoteDataSource);
  }
  //todo : hold Data -- handle Logic
  void getSourcesL(String categoryId) async {
    try {
      //todo : inital state is Loading
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
      if (response?.status != 'ok') {
        //todo: server Error
        emit(SourceErrorState(message: response!.message!));
      } else {
        //todo: server response
        emit(SourceSucessState(SourceList: response!.sources!));
      }
    } catch (e) {
      //todo:خطأ من ناحيه العميل
      emit(SourceErrorState(message: e.toString()));
    }
  }
}
