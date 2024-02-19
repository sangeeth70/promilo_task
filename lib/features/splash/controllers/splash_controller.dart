import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashController,SplashStates>((ref){

return SplashController();
});


class SplashController extends StateNotifier<SplashStates>{
  SplashController() : super(SplashInitial()){
    count();
  }
  count() async{
    await Future.delayed(const Duration(seconds: 3));
    state = SplashEnd();
  }
}

abstract class SplashStates {}

class SplashInitial extends SplashStates {}

class SplashEnd extends SplashStates {}