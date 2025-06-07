import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/cubit/source_state.dart';

//لازم اعمل وراثه بيورث كل حاجه ماعدا ال constructor
class SourceViewModelCubit extends Cubit<SourceState> {
  //todo :intial state
  SourceViewModelCubit() : super(SourceLoadingState());
  //todo : hold Data -- handle Logic
  void getSourcesL(String categoryId) async {
    try {
      //todo : inital state is Loading
      emit(SourceLoadingState());
      var response = await ApiManger.getSources(categoryId);
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
