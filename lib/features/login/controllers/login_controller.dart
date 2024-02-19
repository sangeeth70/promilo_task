import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promilo_app/features/login/data/models/login_model.dart';
import 'package:promilo_app/features/login/data/service/auth_service.dart';

final loginProvider = StateNotifierProvider((ref) {
  final service = ref.watch(authServiceProvider);
  return LoginController(service);
});

class LoginController extends StateNotifier<LoginStates>{
  final AuthService service;
  LoginController(this.service) : super(LoginInitial());

  login(String? username,String? password,)async{
    try{
      state = LoginLoading();

      //-------------- SHA256 conversion
      var bytes = utf8.encode(password ?? "");
      var parsedPassword = sha256.convert(bytes);

      //-------------- credential validation
      const patternEmail = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      const patternMobile = r'^(?:[+0][1-9])?[0-9]{10,12}$';
      final regexEmail = RegExp(patternEmail);
      final regexMobile = RegExp(patternMobile);
      if(regexEmail.hasMatch(username ?? "") || regexMobile.hasMatch(username ?? "")){
        //-------------- login function
        // final response = await service.userLogin('test45@yopmail.com','8776f108e247ab1e2b323042c049c266407c81fbad41bde1e8dfc1bb66fd267e', 'password');
        final response = await service.userLogin(username ??'', parsedPassword.toString(), 'password');
        if(response.status.code == 200) {
          state = LoginSuccess();
        }
      }else{
        print("No");
        final String failMsg = 'Please check the username you have entered.';
        state = LoginFailed(failMsg);
      }
    }catch(e){
      print("err-->$e");
      state = LoginError();
    }
  }
}

abstract class LoginStates {}

class LoginInitial extends LoginStates {}
class LoginLoading extends LoginStates {}
class LoginSuccess extends LoginStates {
  LoginSuccess();
}
class LoginFailed extends LoginStates {
  final String msg;
  LoginFailed(this.msg);
}
class LoginError extends LoginStates {}

