

import 'package:flutter/material.dart';
import 'package:promilo_app/theme/theme.dart';

class MainGreenButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;
  final bool outlined;
  final String? iconName;
  final TextStyle? textStyle;
  final double borderRadius;
  final Color? iconColor;
  final bool isLoading;
  const MainGreenButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.height = 44,
    this.outlined = false,
    this.iconName,
    this.borderRadius = 7,
    this.textStyle,
    this.iconColor,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: PromiloTheme.blueColor,
      minWidth: double.infinity,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: const BorderSide(color: PromiloTheme.blueColor, width: 2)
      ),
      onPressed: onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: mon16white700
          ),
        ],
      ),
    );
  }
}
