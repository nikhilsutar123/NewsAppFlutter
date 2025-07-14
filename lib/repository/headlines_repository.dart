import 'package:dio/dio.dart';
import 'package:news_app/service/network_service.dart';
import 'package:news_app/util/app_functions.dart';

import '../res/constant.dart';

class HeadlinesRepository {
  Future<Response<dynamic>> headlinesRepo(String pageNum) async {
    logConsole(
        "fetching news... ${Constant.headlines}?country=${Constant.countryCodeUs}&page=$pageNum&apiKey=${Constant.apiKey}");
    try {
      var response = await NetworkService.getRequest(
          "${Constant.headlines}?country=${Constant.countryCodeUs}&page=$pageNum&apiKey=${Constant.apiKey}");
      logConsole("data fetched in repository...");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> searchNewsRepo(String query, String pageNum) async {
    logConsole(
        "${Constant.searchNews}?page=$pageNum&pageSize=${Constant.defaultPageSize}&q=$query&apiKey=${Constant.apiKey}");
    try {
      var response = await NetworkService.getRequest(
          "${Constant.searchNews}?page=$pageNum&pageSize=${Constant.defaultPageSize}&q=$query&apiKey=${Constant.apiKey}");
      logConsole("data fetched in repository...");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
