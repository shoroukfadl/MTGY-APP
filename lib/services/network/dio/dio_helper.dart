import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api-mtgy.onrender.com/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "accept": "application/json",
      'x-auth-token': token??'',
    // 'Authorization': token??''
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "accept": "application/json",
      'x-auth-token': token??'',
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> postImage({
    required String url,
    Map<String, dynamic>? query,
    required FormData data,
    String? token
  }) async {
    dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      "accept": "*/*",
      'x-auth-token': token??'',
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "accept": "application/json",
      'x-auth-token': token??'',
    };
    return dio.put(url, queryParameters: query, data: data);
  }

  static Future<Response> deleteData({
    required url,
     Map<String, dynamic>? query,
     Map<String, dynamic>? data,
     String? token
}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "accept": "application/json",
      'x-auth-token': token??'',
    };
    return dio.delete(url ,
      data: data,
      queryParameters: query
    );
  }
}
