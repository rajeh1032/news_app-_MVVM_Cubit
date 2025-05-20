import 'package:news_app_cubit_mvvm/model/source_response.dart';

abstract class SourceState {} // عشان امنع انه يتعمل من اوبجكت واشتعغل ب مبأ ال polymorphism --.pointer from parent ==> object from child class

class SourceInitial
    extends SourceState {} //استخدمها لو مش عندي iinital stata بس ال intial state هي loading

class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String? message;
  SourceErrorState({required this.message});
}

class SourceSucessState extends SourceState {
  List<Source>? SourceList = [];
  SourceSucessState({required this.SourceList});
}
