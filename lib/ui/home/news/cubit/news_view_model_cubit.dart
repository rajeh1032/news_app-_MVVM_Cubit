import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit_mvvm/api/api_manger.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source.dart';
import 'package:news_app_cubit_mvvm/repository/news/data_sources/remote/news_reomote_data_source_imp.dart';
import 'package:news_app_cubit_mvvm/repository/news/repository/news_repository.dart';
import 'package:news_app_cubit_mvvm/repository/news/repository/news_repository_imp.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/cubit/news_state.dart';

class NewsViewModelCubit extends Cubit<NewsState> {
  late NewsRepository newsRepository;

  NewsViewModelCubit({required this.newsRepository})
      : super(NewsLoadingState());
  //todo:hold data--handle logic
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId: sourceId);
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
