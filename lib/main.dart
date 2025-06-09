import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit_mvvm/di/di_inject.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/ui/home/home_screen.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/search_screen.dart';
import 'package:news_app_cubit_mvvm/utils/app_theme.dart';
import 'package:news_app_cubit_mvvm/utils/bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  //todo : path
  final documentDirectory = await getApplicationDocumentsDirectory();
  //todo : intializ hive
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(SourceResponseAdapter());
  Hive.registerAdapter(SourceAdapter());
  configureDependencies(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
