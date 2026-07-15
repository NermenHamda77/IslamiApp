import 'package:flutter/material.dart';
import 'package:islami_app/recourses/quran_recourses.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';

class RecentSuraWidget extends StatelessWidget {
  int index;
  RecentSuraWidget({super.key , required this.index});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding:  EdgeInsets.symmetric(
          horizontal: width*0.06,
          vertical: height*0.02
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(QuranRecourses.englishSuraList[index] , style: AppStyles.bold24Black,),
            Text(QuranRecourses.arabicSuraList[index] , style: AppStyles.bold24Black,),
            Text("${QuranRecourses.ayaNumber[index]} Verses" , style: AppStyles.bold14Black,),
          ],
          ),
          Image.asset(AppImages.mostRecentImage)
        ],
      ),
    );
  }
}
