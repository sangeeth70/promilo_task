import 'package:flutter/material.dart';

class CarouselMainWidget extends StatelessWidget {
  final String img;
  const CarouselMainWidget({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(img,fit: BoxFit.cover,))
    );
  }
}
