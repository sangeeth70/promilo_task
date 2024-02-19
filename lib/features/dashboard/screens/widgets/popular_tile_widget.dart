import 'package:flutter/material.dart';
import 'package:promilo_app/features/dashboard/data/dashboard_data.dart';
import 'package:promilo_app/features/dashboard/screens/widgets/custom_button.dart';
import 'package:promilo_app/theme/theme.dart';

class PopularTileWidget extends StatelessWidget {
  final String title;
  final String meetups;
  final String image;
  final VoidCallback onPressed;
  const PopularTileWidget({super.key, required this.title, required this.meetups, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 6,bottom: 6,right: 16),
      width: 300,
      decoration: BoxDecoration(
      // color: Colors.red,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(width: 1,color: PromiloTheme.lightGrey)
    ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: PromiloTheme.darkBlueColor),
                  borderRadius: BorderRadius.circular(50)
                ),
                child:  CircleAvatar(
                  child: Image.asset(image,fit: BoxFit.cover,height: 24,),
                  backgroundColor: PromiloTheme.whiteColor,
                ),
              ),
              SizedBox(width: 12,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: mon16DarkBlue700,),
                  Text('$meetups Meetups',style: mon14Grey500,)
                ],
              )
            ],
          ),
          Divider(color: PromiloTheme.lightGrey,),
          SizedBox(height: 12,),
          Align(
            alignment: Alignment.centerLeft,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                for (var i = 0; i < 3; i++)
                  Padding(
                    padding: EdgeInsets.only(left: i * 32),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          DashboardData.imgList[i],
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        )),
                  ),
              ],
            ),
          ),
          Align(alignment: Alignment.centerRight,child: CustomButton(title: 'See more', onPressed: onPressed))
        ],
      ),
    );
  }
}
