import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/widgets/most_recent_provider.dart';
import 'package:islami_app/widgets/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_routes.dart';
import '../recourses/quran_recourses.dart';

class RecentSuraWidget extends StatefulWidget {
  const RecentSuraWidget({super.key});

  @override
  State<RecentSuraWidget> createState() => _RecentSuraWidgetState();
}

class _RecentSuraWidgetState extends State<RecentSuraWidget> {
  late MostRecentProvider recentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      recentProvider.getSavedMostRecent();
    });


  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    recentProvider = Provider.of<MostRecentProvider>(context);
    return  Visibility(
      visible: recentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: height*0.01),
            child: Text("Most Recently" , style: AppStyles.bold16White,),
          ),
          SizedBox(
            height: height*0.16,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return  InkWell(
                    onTap: (){
                      saveMostRecent(recentProvider.mostRecentList[index]);
                      Navigator.of(context).pushNamed(
                        AppRoutes.suraDetailsRoute,
                        arguments: recentProvider.mostRecentList[index],
                      );
                    },
                    child: Container(
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
                              Text(QuranRecourses.englishSuraList[recentProvider.mostRecentList[index]] , style: AppStyles.bold24Black,),
                              Text(QuranRecourses.arabicSuraList[recentProvider.mostRecentList[index]] , style: AppStyles.bold24Black,),
                              Text("${QuranRecourses.ayaNumber[recentProvider.mostRecentList[index]]} Verses" , style: AppStyles.bold14Black,),
                            ],
                          ),
                          Image.asset(AppImages.mostRecentImage)
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder:(context , index){
                  return SizedBox(
                    width: width*0.02,
                  );
                },
                itemCount: recentProvider.mostRecentList.length
            ),
          ),
        ],
      ),
    );

  }
}
