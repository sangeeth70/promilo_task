import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:promilo_app/features/login/screens/ui/login_screen.dart';
import 'package:promilo_app/features/splash/controllers/splash_controller.dart';
import 'package:promilo_app/theme/theme.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.listen(splashProvider, (previous, next) {
      if(next is SplashEnd){
        pushNewScreen(context, screen: LoginScreen(),pageTransitionAnimation: PageTransitionAnimation.fade);
      }
    });
    return Scaffold(
      backgroundColor: PromiloTheme.blueColor,
      body: Center(
        child: Image.asset('assets/png/promilo_logo.jpeg',),
      ),
    );
  }
}
