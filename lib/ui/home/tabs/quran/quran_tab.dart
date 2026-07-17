import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/recourses/quran_recourses.dart';
import 'package:islami_app/ui/home/tabs/quran/widget/recent_sura_widget.dart';
import 'package:islami_app/ui/home/tabs/quran/widget/sura_item_widget.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_colors.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
                                             /// 114 suras
  List<int> filterList = List.generate(
      QuranRecourses.arabicSuraList.length, (index)=>index);
  @override
  Widget build(BuildContext context) {

    // 430 * 932
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height*0.015,
        children: [
          TextField(
            onChanged: (newText){
              searchNewSura(newText);
            },
            style: AppStyles.bold16White,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              fillColor: AppColors.blackWithOpacityColor,
              filled: true,
              hintText: "Sura Name",
              hintStyle: AppStyles.bold16White,
              enabledBorder:  buildBorderStyle(),
              focusedBorder: buildBorderStyle(),
              prefixIcon: Image.asset(AppImages.quranImage ,  color: AppColors.primaryColor,),
            ),
          ),
          Text("Most Recently" , style: AppStyles.bold16White,),
          SizedBox(
            height: height*0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return RecentSuraWidget(index: index,);
                },
                separatorBuilder:(context , index){
                  return SizedBox(
                    width: width*0.02,
                  );
                },
                itemCount: 10
            ),
          ),
          Text("Suras List" , style: AppStyles.bold16White,),
          
          filterList.isEmpty ?
              Center(
                child: Text("No Sura is Found" , style: AppStyles.bold20Primary,),)
          :
          Expanded(
            child: ListView.separated(
                itemBuilder: (context , index){
                  return SuraItemWidget(index: filterList[index],onSuraClick: openSuraDetails,);
                },
                separatorBuilder:(context , index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: height*0.01),
                    child: Divider(
                      thickness: 2,
                      indent: width*0.06,
                      endIndent: width*0.06,
                    ),
                  );
                },
                itemCount: filterList.length
            ),
          ),

        ],
      ),
    );
  }

   OutlineInputBorder buildBorderStyle(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 2,
      ),
    );
  }

   void openSuraDetails(int index) {
    Navigator.of(context).pushNamed(AppRoutes.suraDetailsRoute ,
    arguments: index);
  }

  searchNewSura(String newText){
    List<int> searchResultList = [];
    for(int i = 0 ; i < QuranRecourses.arabicSuraList.length ; i++){
      if(QuranRecourses.arabicSuraList[i].contains(newText)){
        searchResultList.add(i);
      }
    }

    for(int i = 0 ; i < QuranRecourses.englishSuraList.length ; i++){
      if(QuranRecourses.englishSuraList[i].toLowerCase().contains(newText.toLowerCase())){
        searchResultList.add(i);
      }
    }

    filterList = searchResultList;
    setState(() {

    });
  }
}
