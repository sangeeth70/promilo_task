import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:promilo_app/features/dashboard/controller/dashboard_controller.dart';
import 'package:promilo_app/features/dashboard/data/dashboard_data.dart';
import 'package:promilo_app/features/dashboard/screens/widgets/carousel_main_widget.dart';
import 'package:promilo_app/features/dashboard/screens/widgets/popular_tile_widget.dart';
import 'package:promilo_app/features/dashboard/screens/widgets/search_bar.dart';
import 'package:promilo_app/features/dashboard/screens/widgets/trending_meetup_widget.dart';
import 'package:promilo_app/features/description/screens/ui/description_screen.dart';
import 'package:promilo_app/theme/theme.dart';

class DashboardScreen extends ConsumerWidget {
  DashboardScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),
        title: const Text('Individual Meetup',style: mon16DarkBlue700,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 12,),
              Consumer(
                builder: (context,ref,_) {
                  final currentIdx = ref.watch(currentIndexProvider);
                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(autoPlay: true,viewportFraction: 1,onPageChanged: (index,reason){
                          ref.read(currentIndexProvider.notifier).updateIndex(index);
                        },),
                        items: DashboardData.imgList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CarouselMainWidget(img: i,);
                            },
                          );
                        }).toList(),
                      ),
                      DotsIndicator(
                        dotsCount: DashboardData.imgList.length,
                        position: currentIdx,
                        decorator: DotsDecorator(
                          activeSize: const Size(14,14),
                          activeShape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                          size: const Size(14, 14),color: PromiloTheme.blueGrey
          
                        ),
                      ),
                    ],
                  );
                }
              ),
              const SizedBox(height: 12,),
              const Align(alignment: Alignment.centerLeft,child: Text("Trending Popular People",style: mon16DarkBlue700,)),
              SizedBox(
                height: 208,
                width: size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: DashboardData.people.length,
                  itemBuilder: (context, index){
                  return PopularTileWidget(title: DashboardData.people[index]['title'] ?? '',image: DashboardData.people[index]['icon'] ??'',meetups: DashboardData.people[index]['meetups'] ??'',onPressed: (){},);
                }),
              ),
              const SizedBox(height: 12,),
              const Align(alignment: Alignment.centerLeft,child: Text("Top Trending Meetups",style: mon16DarkBlue700,)),
              const SizedBox(height: 10),
              SizedBox(
                height: 208,
                width: size.width,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return TrendingMeetupWidget(image: DashboardData.meetups[index],onPressed: (){
                        pushNewScreen(context, screen: const DescriptionScreen());
                      },);
                    }),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        selectedItemColor: PromiloTheme.blueColor, // TextStyle for selected tab
        unselectedItemColor: PromiloTheme.blueGrey,
        currentIndex: selectedIndex,
        onTap: (index){
          ref.read(bottomNavIndexProvider.notifier).state = index;
          print(index);
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: PromiloTheme.blueGrey,),
            label: 'Home',
              activeIcon: Icon(Icons.home,color: PromiloTheme.blueColor,)

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_outlined,color: PromiloTheme.blueGrey,),
            label: 'Prolet',
              activeIcon: Icon(Icons.apps,color: PromiloTheme.blueColor,)

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined,color: PromiloTheme.blueGrey,),
            label: 'Meetup',
              activeIcon: Icon(Icons.handshake,color: PromiloTheme.blueColor,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined,color: PromiloTheme.blueGrey,),
            label: 'Explore',

              activeIcon: Icon(Icons.explore,color: PromiloTheme.blueColor,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,color: PromiloTheme.blueGrey,),
            label: 'Account',
            activeIcon: Icon(Icons.person_2_outlined,color: PromiloTheme.blueColor,)
          ),
        ],
      ),
    );
  }
}
