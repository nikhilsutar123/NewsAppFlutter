import 'package:dio/dio.dart';
import 'package:news_app/util/app_exceptions.dart';

import '../res/constant.dart';

class NetworkService {
  static final Dio _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: Constant.timeout),
      contentType: 'application/json'));

  static Future<Response> getRequest(String url,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.get(url, data: data ?? {});
      if (response.statusCode == Constant.successCode) {
        return response;
      } else {
        throw FetchDataException("Failed to fetch data", url);
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw FetchDataException("Connection timed out!");
        case DioExceptionType.badResponse:
          if (e.response!.statusCode == Constant.badRequest) {
            throw BadRequestException("Bad Request: ${e.response!.data}");
          } else if(e.response!.statusCode == Constant.unauthorizedRequest){
            throw UnauthorizedException("Unauthorized access: ${e.response!.data}");
          }
        case DioExceptionType.sendTimeout:
          // TODO: Handle this case.
        case DioExceptionType.receiveTimeout:
          // TODO: Handle this case.
        case DioExceptionType.badCertificate:
          // TODO: Handle this case.
        case DioExceptionType.cancel:
          // TODO: Handle this case.
        case DioExceptionType.connectionError:
          // TODO: Handle this case.
        case DioExceptionType.unknown:
          // TODO: Handle this case.
      }
    } catch(e){
      throw FetchDataException(e.toString());
    }
    throw FetchDataException("Something went wrong!");
  }
}
