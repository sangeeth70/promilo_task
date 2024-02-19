import 'package:flutter/material.dart';
import 'package:promilo_app/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,color: PromiloTheme.blueColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),child: Text(title,style: mon12white500,),);
  }
}
