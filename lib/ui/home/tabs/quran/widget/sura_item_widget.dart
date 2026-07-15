import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../recourses/quran_recourses.dart';

typedef OnSuraClick = void Function(int);
class SuraItemWidget extends StatelessWidget {
  int index;
  OnSuraClick onSuraClick;

  SuraItemWidget({super.key, required this.index , required this.onSuraClick});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        onSuraClick(index);
      },
      child: Row(
        spacing: width*0.06,
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Image.asset(AppImages.numberFrameImage),
              Text("${index + 1}", style: AppStyles.bold20White),
            ],
          ),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranRecourses.englishSuraList[index] ,
                style: AppStyles.bold20White,
              ),
              Text(
                "${QuranRecourses.ayaNumber[index]} Verses" ,
                style: AppStyles.bold14Black.copyWith(
                  color: AppColors.whiteColor
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            QuranRecourses.arabicSuraList[index] ,
            style: AppStyles.bold20White,
          ),
        ],
      ),
    );
  }
}
