import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: 'https://6598e287a20d3dc41cef06eb.mockapi.io/',
  connectTimeout: 5000,
  receiveTimeout: 3000
));

class ApiClient{
  Future<Response> get(String path) async{
    try{
      final response = await dio.get(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try{
      final response = await dio.post(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e){
      throw Exception(e.message);
    }
  }

  Future<Response> put(String path, dynamic data) async{
    try{
      final response = await dio.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
  Future<Response> delete(String path) async{
    try{
      final response = await dio.put(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}