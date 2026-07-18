import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class ContentWidget extends StatelessWidget {
  String content;
  bool isNormal;
  int index;
  ContentWidget({super.key ,
     required this.content,
     this.isNormal = true,
      this.index = 0
   });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
   // var width = MediaQuery.of(context).size.width;
    return
      isNormal == true ?
      Text(
      content ,
      style: AppStyles.bold20Primary,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ):
      Container(
        padding: EdgeInsets.symmetric(
            vertical: height*0.02
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: AppColors.primaryColor,
                width: 2
            )
        ),

        // "${content} /*[${index+1}]*/"
        child: Text(
          "${content} [${index+1}]",
          style: AppStyles.bold20Primary,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      )
    ;
  }
}
