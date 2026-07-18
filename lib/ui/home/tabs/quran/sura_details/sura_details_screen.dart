import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/widget/content_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import '../../../../../widgets/most_recent_provider.dart';
import '../recourses/quran_recourses.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late int suraArgs;

  String suraContent = "";
  List<String> suraList = [];

  bool isNormal = true;
  late MostRecentProvider recentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    recentProvider.getSavedMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    suraArgs = ModalRoute.of(context)?.settings.arguments as int;
    recentProvider = Provider.of<MostRecentProvider>(context);

    if(suraContent.isEmpty){
      loadSuraFile(suraArgs);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          QuranRecourses.englishSuraList[suraArgs],
          style: AppStyles.bold20Primary,
        ),
        actions: [
          /// With No Border
          IconButton(
            onPressed: (){
              if(!isNormal){
                isNormal = true;
                setState(() {

                });
              }
            },
            icon: Icon(
              Icons.view_headline ,
              color: isNormal ?
              AppColors.offWhiteColor:
              AppColors.primaryColor,
            ),
          ),
          /// With Border
          IconButton(
            onPressed: (){
              if(isNormal){
                isNormal = false;
                setState(() {

                });
              }
            },
            icon: Icon(Icons.view_agenda_outlined ,
              color: !isNormal ?
              AppColors.offWhiteColor:
              AppColors.primaryColor,
            ),
          ),
        ],
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
              child:

                  isNormal == true ?
                  /// To show normal way
              suraContent.isEmpty ?
                  Center(child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),)
              :
              SingleChildScrollView(
                child: ContentWidget(content: suraContent),
              ) :

                  /// To show bordered way
                  suraList.isEmpty ?
                  Center(child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),)
                      :
                  ListView.separated(
                      itemBuilder: (context , index){
                        return ContentWidget(
                            content: suraList[index],
                            isNormal: false,
                            index: index,
                        );
                      },
                      separatorBuilder: (context , index){
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: suraList.length
                  ),
              ///
            ),
          ),
          Image.asset(AppImages.quranBottomMosque),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int suraIndex) async {
    String filePath = "assets/files/quran/${suraIndex+1}.txt";
   String fileContent = await rootBundle.loadString(filePath);
   suraList = fileContent.split("\n");
   List<String> temp = List.from(suraList);

    for(int i = 0 ; i < temp.length ; i++){
      temp[i] += "[${i+1}]";
   }
   suraContent = temp.join(" ");
    Future.delayed(Duration(milliseconds: 100));
   setState(() {});

  }

}
