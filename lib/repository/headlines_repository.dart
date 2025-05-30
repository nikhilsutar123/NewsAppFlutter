import 'package:dio/dio.dart';
import 'package:news_app/service/network_service.dart';
import 'package:news_app/util/app_exceptions.dart';
import 'package:news_app/util/app_functions.dart';

import '../data/news_model.dart';
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
}
