import 'package:dio/dio.dart';
import 'package:news_app/service/network_service.dart';
import 'package:news_app/util/app_exceptions.dart';

import '../data/news_model.dart';
import '../res/constant.dart';

class HeadlinesRepository {
  Future<Response<dynamic>> headlinesRepo() async {
    try {
      var response = await NetworkService.getRequest(Constant.headlines);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
