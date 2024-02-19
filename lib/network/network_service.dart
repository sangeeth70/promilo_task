import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) {
  return NetworkClient(
    token: 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
  );
});

class NetworkClient {
  final String? token;
  late final Dio _dio;

  NetworkClient({this.token}) {
    _dio = Dio();
  }

  Future<dynamic> postRequest(String path) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "$token"
    };
    print(_dio.options.baseUrl);
    try {
      final response = await _dio.post(path);
      return response.data;
    } on DioException catch (e) {
      print(e.toString());
    }
  }
}