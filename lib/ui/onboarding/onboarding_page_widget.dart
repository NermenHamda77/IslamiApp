import 'package:flutter/material.dart';
import 'package:islami_app/model/onboarding_model.dart';
import 'package:islami_app/utils/app_styles.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingPageWidget({super.key, required this.onboardingModel});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top:  size.height * 0.054,
        left: size.width * 0.05,
        right: size.width * 0.05,

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(onboardingModel.image),
          Text(onboardingModel.title ,
            style: AppStyles.bold24Primary ,
            textAlign: TextAlign.center,
          ),
          Text(onboardingModel.description ,
            style: AppStyles.bold20Primary,
            textAlign: TextAlign.center,

            softWrap: true,),

        ],
      ),
    );
  }
}
