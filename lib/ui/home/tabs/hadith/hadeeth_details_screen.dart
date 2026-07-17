import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeeth_args.dart';
import 'package:islami_app/ui/home/tabs/quran/widget/content_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadeethDetailsScreen extends StatelessWidget {
  HadeethDetailsScreen({super.key});

  late HadeethArgs hadeethArgs;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    hadeethArgs = ModalRoute.of(context)?.settings.arguments as HadeethArgs;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          "Hadeeth ${hadeethArgs.index}",
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
                  hadeethArgs.hadeeth.title,
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
              child:
              SingleChildScrollView(
                child: ContentWidget(content: hadeethArgs.hadeeth.content),
              )

            ),
          ),
          Image.asset(AppImages.quranBottomMosque),
        ],
      ),
    );
  }

}
