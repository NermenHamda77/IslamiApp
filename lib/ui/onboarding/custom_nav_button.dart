import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

typedef OnNavButtonClick = void Function();

class CustomNavButton extends StatelessWidget {
  final String title;
  final OnNavButtonClick buttonClick;
  final Alignment alignment;

  const CustomNavButton({super.key,
    required this.title,
    required this.buttonClick,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: () {
          buttonClick();
        },
        child: Text(title,
        style: AppStyles.bold16Primary,),
      ),
    );
  }
}
