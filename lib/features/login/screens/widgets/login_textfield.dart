// import 'package:flutter/material.dart';
//
// class LoginTextField extends StatelessWidget {
//   final TextEditingController  controller;
//   final String  hintText;
//   const LoginTextField({super.key, required this.controller, required this.hintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration:  InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10)
//         )
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:promilo_app/theme/theme.dart';

ValueNotifier<bool> showPassword = ValueNotifier(true);
class MainTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  const MainTextField({
    Key? key,
    this.hintText,
    this.controller, this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showPassword,
        builder: (context,val,_) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter $hintText";
              } else {
                return null;
              }
            },
            controller: controller,
            cursorColor: PromiloTheme.blueColor,
            obscureText:isPassword ? val : false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              suffixIcon:isPassword ? IconButton(
                icon: Icon(val ? Icons.visibility_outlined : Icons.visibility_off_outlined,color: PromiloTheme.darkGreyColor),
                onPressed: (){
                  showPassword.value = !val;
                },
              ) : null,
              hintText: hintText,
              hintStyle: mon12black500,
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: PromiloTheme.darkGreyColor, width: 1.5)),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: PromiloTheme.blueColor, width: 2)),
            ),
          );
        }
    );
  }
}