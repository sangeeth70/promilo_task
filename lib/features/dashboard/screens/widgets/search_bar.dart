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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promilo_app/theme/theme.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  const SearchBarWidget({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: PromiloTheme.blueColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        prefixIcon: Icon(Icons.search,color: PromiloTheme.darkBlueColor,),
        suffixIcon:IconButton(
          icon: const Icon(CupertinoIcons.mic,color: PromiloTheme.darkBlueColor),
          onPressed: (){},
        ),
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
}