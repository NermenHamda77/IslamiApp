import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class SelectorContainerWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  const SelectorContainerWidget({
    super.key,
    required this.title,
    this.isSelected = true,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ?
        AppColors.primaryColor:
        AppColors.blackButtonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsetsGeometry.symmetric(
          vertical: height*0.017
      ),
      child: Text(title, style: isSelected ?
      AppStyles.bold16Black:
        AppStyles.bold16White,
        textAlign: TextAlign.center,),
    );
  }
}