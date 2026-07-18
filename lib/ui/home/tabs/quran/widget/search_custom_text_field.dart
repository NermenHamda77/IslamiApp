import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_styles.dart';

typedef OnTextFieldClick = void Function(String);
class SearchCustomTextField extends StatelessWidget {
  OnTextFieldClick searchNewSura;
  SearchCustomTextField({super.key , required this.searchNewSura});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
}
