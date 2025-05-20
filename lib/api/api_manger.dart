import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_cubit_mvvm/api/api_constant.dart';
import 'package:news_app_cubit_mvvm/api/end_point.dart';
import 'package:news_app_cubit_mvvm/model/news_response.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';

class ApiManger {
  ///https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoint.sourceApi,
        {'apiKey': ApiConstant.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;

      ///string
      //String=>json =>object
      var json = jsonDecode(bodyString); //json
      return SourceResponse.fromJson(json); //object
      // SourceResponse.fromJson(jsonDecode(response.body));}
    } catch (e) {
      throw e;
    }
  }

  ///https://newsapi.org/v2/everything?apiKey=97dd6c1ac1df483aa508c63a8eed7cf7
  static Future<NewsResponse?> getNewsBySourceId(
      {required String sourceId, String? query}) async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoint.newsApi, {
      'apiKey': ApiConstant.apiKey,
      'sources': sourceId,
      if (query != null && query.isNotEmpty) 'q': query
    });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
/*
static Future<NewsResponse?> getNewsBySourceId(String sourceId, {String? query}) async {
  Uri url = Uri.https(  ApiConstant.baseUrl,EndPoint.newsApi, {  'apiKey': ApiConstant.apiKey, 'sources': sourceId,if (query != null && query.isNotEmpty) 'q': query,},);

  try {
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return NewsResponse.fromJson(json);
  } catch (e) {
    throw e;
  }
}


*/