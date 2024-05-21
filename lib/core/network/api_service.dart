import 'package:bookly/core/presentation/constant.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('${Constant.baseUrl}$endpoint');
    return response.data;
  }
}
