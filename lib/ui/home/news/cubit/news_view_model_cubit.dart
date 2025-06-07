import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/cubit/news_state.dart';

class NewsViewModelCubit extends Cubit<NewsState> {
  NewsViewModelCubit() : super(NewsLoadingState());
  //todo:hold data--handle logic
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await ApiManger.getNewsBySourceId(sourceId: sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));

        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
