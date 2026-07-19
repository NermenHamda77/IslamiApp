import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_colors.dart';

class SebihaTab extends StatefulWidget {
   SebihaTab({super.key});

  @override
  State<SebihaTab> createState() => _SebihaTabState();
}

class _SebihaTabState extends State<SebihaTab> {
   final List<String> azkarList = [
     "سبحان الله" ,
     "الحمد لله" ,
     "الله أكبر",
     "لا حول ولا قوة إلا بالله",
     "استغفر الله العلي العظيم"
   ];

   int counter = 0;
   double angle = 0;

   int counterIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.017),
      child: Column(
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى" , style: AppStyles.bold36White,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.05),
            child: Stack(
              alignment: AlignmentGeometry.topCenter,
              children: [
                Image.asset(AppImages.sebihaHead),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: height*0.09),
                  child: GestureDetector(
                    onTap: (){
                      changeAlzekrText();
                    },
                      child: AnimatedRotation(
                          turns: angle,
                          duration: Duration(seconds: 1),
                      child: Image.asset(AppImages.sebihaBody))),
                ),
                Positioned.fill(
                  child: Column(
                    spacing: height*0.01,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(

                        child: Text(azkarList[counterIndex] ,
                          style: AppStyles.bold36White,
                          textAlign: TextAlign.center,
                        ),
                        width: width*0.55,
                      ),
                      Text("$counter" , style: AppStyles.bold36White,),
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  void changeAlzekrText()  {
   counter++;
   angle += 0.04;
   if(counter % 10 == 0){
     counterIndex++;
   }
   if(counterIndex == azkarList.length){
     counterIndex = 0;
   }
   setState(() {

   });
  }
}

