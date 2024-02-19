import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:promilo_app/features/dashboard/data/dashboard_data.dart';
import 'package:promilo_app/features/description/controller/description_controller.dart';
import 'package:promilo_app/theme/theme.dart';
// import 'package:share_plus/share_plus.dart';

class DescriptionImageWidget extends ConsumerWidget {
  final String image;
  const DescriptionImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.55,
      width: size.width,
      decoration: const BoxDecoration(
        color: PromiloTheme.lightGrey2,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
      ),
      child: Column(
        children: [
          Container(
            height: size.height*0.48,
            // margin: EdgeInsets.only(bottom: 50),
            child: ClipRRect(borderRadius: BorderRadius.circular(16),child: Image.network(image,fit: BoxFit.cover,)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.download_outlined)),
              IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border)),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: (){}, icon: Icon(Icons.crop_free)),
              IconButton(onPressed: (){}, icon: Icon(Icons.star_border)),
              IconButton(onPressed: ()async{
                // Share.share("Share this text");
                await FlutterShare.share(title: 'Share App',text: 'Share this text');
              }, icon: Icon(Icons.share)),
            ],
          ),
        ],
      ),
    );
  }
}
