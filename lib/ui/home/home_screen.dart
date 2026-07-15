import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebiha/sebiha_tab.dart';
import 'package:islami_app/ui/home/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppImages.quranBg,
    AppImages.hadithBg,
    AppImages.sebihaBg,
    AppImages.radioBg,
    AppImages.timeBg,
  ];
  Map<int,String> imagesList = {
    0 : AppImages.quranBg,
    1 : AppImages.hadithBg,
    2 : AppImages.sebihaBg,
    3 : AppImages.radioBg,
    4 : AppImages.timeBg,
  };
  List<Widget> tabsList = [
    QuranTab(), HadithTab() , SebihaTab() , RadioTab() , TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
               getBackgroundImage()
              //imagesList[selectedIndex]!
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            spacing: height*0.01,
            children: [
              Image.asset(AppImages.logo),
              Expanded(child: tabsList[selectedIndex]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          selectedIndex = index;
          setState(() {

          });
        },
        items: [
          buildBottomNavigationBar(
              title: "Quran",
              image: AppImages.quranImage,
            index: 0
          ),
          buildBottomNavigationBar(
            title: "Hadith",
            image: AppImages.hadithImage,
            index: 1
          ),
          buildBottomNavigationBar(
            title: "Sebiha",
            image: AppImages.sebihaImage,
              index: 2
          ),
          buildBottomNavigationBar(
              title: "Radio",
              image: AppImages.radioImage,
              index: 3
          ),
          buildBottomNavigationBar(
              title: "Time",
              image: AppImages.timeImage,
              index: 4
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBar({
    required String title,
    required String image,
    required int index,
  }) {
    return index == selectedIndex
        ? BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 6
          ),
          decoration: BoxDecoration(
            color: AppColors.blackWithOpacityColor,
            borderRadius: BorderRadius.circular(66),
          ),
            child: ImageIcon(AssetImage(image))
        ),
        label: title,

    )
        : BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(image)),
      label: title,
    );
  }

  String getBackgroundImage(){
    switch(selectedIndex){
      case 0 :
        return AppImages.quranBg;
      case 1:
        return AppImages.hadithBg;
      case 2 :
        return AppImages.sebihaBg;
      case 3:
        return AppImages.radioBg;
      case 4 :
        return AppImages.timeBg;
      default:
        return AppImages.hadithBg;
    }
  }
}
