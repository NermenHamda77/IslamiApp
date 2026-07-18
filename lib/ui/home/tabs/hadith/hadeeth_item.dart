import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeeth.dart';
import 'package:islami_app/model/hadeeth_args.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadeethItem extends StatefulWidget {
  final int index;

  HadeethItem({super.key , required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeeth? hadeeth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadeethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      /*width: double.infinity,
      height: double.infinity,*/
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage(AppImages.hadeethBackground)) ,
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: hadeeth == null ?
          Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          )
          :
      Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: width*0.03,
              vertical: height*0.01
            ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.hadeethLeftCorner),
                Expanded(
                    child: Text(
                      hadeeth?.title ?? "" ,
                      style: AppStyles.bold24Black,
                      textAlign: TextAlign.center,
                    )),
                Image.asset(AppImages.hadeethRightCorner),
              ],
            ),
          ),
          Expanded(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(AppRoutes.hadeethDetailsScreenRoute ,
                  arguments: HadeethArgs(hadeeth: hadeeth!, index: widget.index));
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: width*0.07),
                  child: Text(
                    hadeeth?.content ?? "" ,
                    style: AppStyles.bold16Black,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,


                  ),
                ),
              )
          ),
         // Spacer(),
          Image.asset(AppImages.hadeethBottomMosque , width: double.infinity, fit: BoxFit.fill,)
        ],
      ),
    );
  }

  loadHadeethFile() async {
    String fileContent = await rootBundle.loadString("assets/files/hadeeth/h${widget.index}.txt");
    int fileContentIndex = fileContent.indexOf("\n");
    String title = fileContent.substring(0 , fileContentIndex);
    String content = fileContent.substring(fileContentIndex+1);
    hadeeth = Hadeeth(content: content, title: title);
    setState(() {

    });
  }
}
