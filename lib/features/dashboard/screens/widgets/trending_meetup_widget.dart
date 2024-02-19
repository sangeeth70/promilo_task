import 'package:flutter/material.dart';
import 'package:promilo_app/theme/theme.dart';

class TrendingMeetupWidget extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const TrendingMeetupWidget({super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
return InkWell(
  onTap: onPressed,
  child: Container(
    margin: const EdgeInsets.only(right: 12,),
    width: 250,
    child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(image,fit: BoxFit.cover,)),
  ),
);
}}
