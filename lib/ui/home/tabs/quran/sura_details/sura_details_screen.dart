import 'package:flutter/material.dart';
import 'package:islami_app/recourses/quran_recourses.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraDetailsScreen extends StatelessWidget {
  SuraDetailsScreen({super.key});

  late int suraArgs;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    suraArgs = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          QuranRecourses.englishSuraList[suraArgs],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.leftCorner),
                Text(
                  QuranRecourses.arabicSuraList[suraArgs],
                  style: AppStyles.bold24Primary,
                ),
                Image.asset(AppImages.rightCorner),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.04,
              ),
              child: Container(),
            ),
          ),
          Image.asset(AppImages.bottomMosque),
        ],
      ),
    );
  }
}
