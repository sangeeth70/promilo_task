import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promilo_app/features/dashboard/data/dashboard_data.dart';
import 'package:promilo_app/features/description/controller/description_controller.dart';
import 'package:promilo_app/features/description/screens/widgets/desc_img_widget.dart';
import 'package:promilo_app/theme/theme.dart';

import '../../../dashboard/controller/dashboard_controller.dart';

class DescriptionScreen extends ConsumerWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Description',
          style: mon16DarkBlue700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(height: size.height * 0.55,autoPlay: true,viewportFraction: 1,onPageChanged: (index,reason){
                          ref.read(descIdxProvider.notifier).updateIndex(index);
                        },),
                        items: DashboardData.descImages.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return DescriptionImageWidget(image: i,);
                            },
                          );
                        }).toList()),
                      Positioned(
                          top: size.height * 0.42,
                          left: size.width /3
                          ,child: Consumer(
                          builder: (context,ref,_) {
                            final idx = ref.watch(descIdxProvider);
                            return DotsIndicator(
                                position: idx,
                                dotsCount: DashboardData.descImages.length);
                          }
                      ))
                    ],
                  ),
            // DescriptionImageWidget(),
            SizedBox(
              height: 8,
            ),
            Row(children: [
              Icon(Icons.bookmark_border,color: PromiloTheme.blueColor),
              SizedBox(width: 6,),
              Text('1034',style: mon14Grey500,),
              SizedBox(width: 10,),
              Icon(Icons.favorite_border,color: PromiloTheme.blueColor),
              SizedBox(width: 6,),
              Text('1034',style: mon14Grey500,),
              SizedBox(width: 10,),
              Container(
                height: 20,
                width: 130,
                decoration: BoxDecoration(
                  color: PromiloTheme.lightGrey2,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.star,size: 20,color: PromiloTheme.skyBlue,),
                    Icon(Icons.star,size: 20,color: PromiloTheme.skyBlue.withOpacity(0.8),),
                    Icon(Icons.star,size: 20,color: PromiloTheme.skyBlue.withOpacity(0.6),),
                    Icon(Icons.star,size: 20,color: PromiloTheme.skyBlue.withOpacity(0.4),),
                    Icon(Icons.star,size: 20,color: PromiloTheme.whiteColor,),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text('3.2',style: mon14Blue500,)
            ],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12,),
                Text('Author',style: mon20darkBlue700,),
                SizedBox(height: 2,),
                Text('Category',style: mon14Grey500,),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Icon(Icons.access_time,color: PromiloTheme.lightGrey,),
                    SizedBox(width: 8,),
                    Text('Duration 20 min',style: mon14Grey500,),],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Icon(Icons.wallet,color: PromiloTheme.lightGrey,),
                    SizedBox(width: 8,),
                    Text('Total Average Fees ₹9,999',style: mon14Grey500,),],
                ),
                SizedBox(height: 12,),
                Text('About',style: mon20darkBlue700,),
                Text('From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',style: mon14Grey500,),
              ],
            ),
          ],
            ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        selectedItemColor: PromiloTheme.blueColor, // TextStyle for selected tab
        unselectedItemColor: PromiloTheme.blueGrey,
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
          print(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: PromiloTheme.blueGrey,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: PromiloTheme.skyBlue,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps_outlined,
                color: PromiloTheme.blueGrey,
              ),
              label: 'Prolet',
              activeIcon: Icon(
                Icons.apps,
                color: PromiloTheme.skyBlue,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.handshake_outlined,
                color: PromiloTheme.blueGrey,
              ),
              label: 'Meetup',
              activeIcon: Icon(
                Icons.handshake,
                color: PromiloTheme.skyBlue,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
                color: PromiloTheme.blueGrey,
              ),
              label: 'Explore',
              activeIcon: Icon(
                Icons.explore,
                color: PromiloTheme.skyBlue,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: PromiloTheme.blueGrey,
              ),
              label: 'Account',
              activeIcon: Icon(
                Icons.person_2_outlined,
                color: PromiloTheme.skyBlue,
              )),
        ],
      ),
    );
  }
}
