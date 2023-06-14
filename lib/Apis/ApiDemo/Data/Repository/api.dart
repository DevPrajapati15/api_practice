import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class API{

 String baseURL = "https://jsonplaceholder.typicode.com/";

  Dio _dio = Dio();

  API(){
    _dio.options.baseUrl = baseURL;
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}