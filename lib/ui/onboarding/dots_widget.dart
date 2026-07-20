import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
typedef OnDotsClick = void Function(int);
class DotsWidget extends StatelessWidget {
  final int pagesCount;
  final int currentIndex;
  final OnDotsClick onDotsClick;
  const DotsWidget({
    super.key,
    required this.pagesCount,
    required this.currentIndex,
    required this.onDotsClick
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
      List.generate(pagesCount ,
          ((index) {
            return GestureDetector(
              onTap: (){
                onDotsClick(index);
              },
              child: Container(
                width: 10,
                height: 10,
                margin: EdgeInsetsGeometry.symmetric(horizontal: 4),

                decoration: BoxDecoration(
                    color: currentIndex == index ?
                    AppColors.primaryColor :
                    AppColors.grayColor,
                    shape: BoxShape.circle
                ),
              ),
            );
          })),

    );
  }
}
