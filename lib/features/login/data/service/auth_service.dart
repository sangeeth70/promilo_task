
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promilo_app/features/login/data/models/login_model.dart';
import 'package:promilo_app/network/network_service.dart';

final authServiceProvider = StateProvider((ref) {
  final client = ref.watch(dioProvider);
  return AuthService(client: client);
});

class AuthService {
  NetworkClient client;
  AuthService({required this.client});


  Future<LoginModel> userLogin(String username, String password,String type) async {
    try {
      final response = await client.postRequest("https://apiv2stg.promilo.com/user/oauth/token?username=$username&password=$password&grant_type=$type");
      print("res---->$response");
      final loginResponse = LoginModel.fromJson(response);
      print("res---->$loginResponse");
      return loginResponse;
    } catch (_) {
      rethrow;
    }
  }
}