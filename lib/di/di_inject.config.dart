// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manger.dart' as _i339;
import '../repository/news/data_sources/remote/news_reomote_data_source.dart'
    as _i279;
import '../repository/news/data_sources/remote/news_reomote_data_source_imp.dart'
    as _i426;
import '../repository/news/repository/news_repository.dart' as _i251;
import '../repository/news/repository/news_repository_imp.dart' as _i235;
import '../repository/sources/dataSources/oflline/source_offline_data_source.dart'
    as _i1060;
import '../repository/sources/dataSources/oflline/source_offline_data_source_imp.dart'
    as _i969;
import '../repository/sources/dataSources/remote/source_remote_data_source.dart'
    as _i675;
import '../repository/sources/dataSources/remote/source_remote_data_source_imp.dart'
    as _i586;
import '../repository/sources/repository/source_repository.dart' as _i7;
import '../repository/sources/repository/source_repository_imp.dart' as _i871;
import '../ui/home/category_details/cubit/source_view_model_cubit.dart'
    as _i738;
import '../ui/home/news/cubit/news_view_model_cubit.dart' as _i587;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i279.NewsReomoteDataSource>(
        () => _i426.NewsReomoteDataSourceImp(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i1060.SourceOfflineDataSource>(
        () => _i969.SourceOfflineDataSourceImp());
    gh.factory<_i675.SourceRemoteDataSource>(() =>
        _i586.SourceRemoteDataSourceImp(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i251.NewsRepository>(() => _i235.NewsRepositoryImp(
        reomoteDataSource: gh<_i279.NewsReomoteDataSource>()));
    gh.factory<_i7.SourceRepository>(() => _i871.SourceRepositoryImp(
          remoteDataSource: gh<_i675.SourceRemoteDataSource>(),
          offlineDataSource: gh<_i1060.SourceOfflineDataSource>(),
        ));
    gh.factory<_i587.NewsViewModelCubit>(() =>
        _i587.NewsViewModelCubit(newsRepository: gh<_i251.NewsRepository>()));
    gh.factory<_i738.SourceViewModelCubit>(() => _i738.SourceViewModelCubit(
        sourceRepository: gh<_i7.SourceRepository>()));
    return this;
  }
}
