import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:promilo_app/features/dashboard/screens/ui/dashboard_screen.dart';
import 'package:promilo_app/features/login/controllers/login_controller.dart';
import 'package:promilo_app/features/login/data/service/auth_service.dart';
import 'package:promilo_app/features/login/screens/widgets/main_button.dart';
import 'package:promilo_app/theme/theme.dart';

import '../widgets/login_textfield.dart';

class LoginScreen extends ConsumerWidget {
  static const route = '/login-screen';
  LoginScreen({super.key});
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.listen(loginProvider, (previous, next) {
      if(next is LoginSuccess){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Successful'),duration: Duration(seconds: 2),backgroundColor: Colors.green,));
        pushNewScreen(context, screen: DashboardScreen());
      }else if(next is LoginFailed){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.msg)));
      } else if(next is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Failed'),duration: Duration(seconds: 2),backgroundColor: Colors.redAccent,));
      }
    });
    final controller = ref.watch(loginProvider);
    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();
    ValueNotifier<bool> isChecked = ValueNotifier(false);
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: PromiloTheme.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Form(
            // autovalidateMode: AutovalidateMode.always,
            key: _loginForm,
            child: Column(
              children: [
                SizedBox(
                  height: size.height*0.10,
                  width: size.width,
                ),
                const Text("promilo",style: mon16black700,),
                SizedBox(
                  height: size.height*0.05,
                ),
                const Text("Hi, Welcome Back!",style: mon20black700,),
                SizedBox(
                  height: size.height*0.05,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Please Sign in to continue",style: mon12black500,)),
                const SizedBox(
                  height: 10,
                ),
                MainTextField(hintText:'Enter Email or Mob No.',controller: username,),
                const SizedBox(
                  height: 12,
                ),
                 Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: (){},
                        child: const Text("Sign In With Otp",style: mon14Blue700,))),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password",style: mon12black500,)),
                const SizedBox(
                  height: 8,
                ),
                MainTextField(hintText: 'Enter Password',isPassword: true,controller: password),
                const SizedBox(
                  height: 12,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isChecked,
                      builder: (context,val,_){
                        return InkWell(
                          onTap: (){
                            isChecked.value = !val;
                          },
                          child: Row(
                            children: [
                              Icon(val ? Icons.check_box : Icons.check_box_outline_blank,color: PromiloTheme.blueColor),
                              const SizedBox(width: 6,),
                              const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Remember me",style: mon14Grey500,)),
                            ],
                          ),
                        );
                      }
                    ),
                     Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: (){},
                            child: const Text("Forgot Password",style: mon14Blue700,))),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                if(controller is !LoginLoading)
                MainGreenButton(title: "Submit", onPressed: ()async{
                  if(_loginForm.currentState?.validate() ?? false) {
                    await ref.read(loginProvider.notifier).login(username.text, password.text);
                  }
                })
                else
                const Center(child: CircularProgressIndicator()),
                const SizedBox(
                  height: 16,
                ),
            
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 30,
                      color: PromiloTheme.whiteColor,
                      child: const Text("or"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(onTap: (){},child: SvgPicture.asset('assets/svg/google.svg',height:35,)),
                      InkWell(onTap: (){},child: SvgPicture.asset('assets/svg/linkedin.svg',height:35,)),
                      InkWell(onTap: (){},child: SvgPicture.asset('assets/svg/facebook.svg',height:35,)),
                      InkWell(onTap: (){},child: SvgPicture.asset('assets/svg/instagram.svg',height:35,)),
                      InkWell(onTap: (){},child: SvgPicture.asset('assets/svg/whatsapp.svg',height:35,)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Business user?",style: mon14Grey500,),
                    Text("Don't have an account?",style: mon14Grey500,),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: (){},child: const Text("Login here",style: mon14Blue700,)),
                    InkWell(onTap: (){},child: const Text("Sign Up",style: mon14Blue700,)),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text("By continuing, you agree to",style: mon12grey500,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Text("Promilo's ",style: mon12grey500,),
                     InkWell(onTap: (){},child: const Text("Terms of Use & Privacy Policy",style: mon12black500,)),
                  ],
                ),
                // RichText(text: const TextSpan(text: "Promilo's ",style: mon12grey500,children: [
                //   TextSpan(text: 'Terms of Use & Privacy Policy',style: mon12black500)
                // ]),),
            
              ],
            ),
          ),
        ),
      )
    );
  }
}


