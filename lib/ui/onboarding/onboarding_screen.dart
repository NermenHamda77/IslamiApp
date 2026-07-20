import 'package:flutter/material.dart';
import 'package:islami_app/model/onboarding_model.dart';
import 'package:islami_app/ui/onboarding/custom_nav_button.dart';
import 'package:islami_app/ui/onboarding/dots_widget.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/widgets/shared_prefs_utils.dart';
import '../../utils/app_colors.dart';
import 'onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
   const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingModel> pages = [
    OnboardingModel(
        title: "Welcome To Islmi App",
        image: AppImages.introWelcomeImage,
        description:""
    ),
    OnboardingModel(
        title: "Welcome To Islami",
        image: AppImages.introMosqueImage,
        description:"We Are Very Excited To Have You In Our Community"
    ),
    OnboardingModel(
        title: "Reading the Quran",
        image: AppImages.introQuranImage,
        description:"Read, and your Lord is the Most Generous"
    ),
    OnboardingModel(
        title: "Tasbeeh",
        image: AppImages.introSebhaImage,
        description:"Praise the name of your Lord, the Most High"
    ),
    OnboardingModel(
        title: "Holy Quran Radio",
        image: AppImages.introRadioImage,
        description:"You can listen to the Holy Quran Radio through the application for free and easily"
    ),
  ];

  final PageController pageController = PageController();
  int currentIndex = 0;


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.blackColor,
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(AppImages.logo),
              SizedBox(height: size.height * 0.017),
              Expanded(
                child: PageView.builder(
                    itemBuilder: (context , index){
                     return OnboardingPageWidget(onboardingModel: pages[index],);
                    },
                  itemCount: pages.length,
                  controller: pageController,
                  onPageChanged: (index){
                      currentIndex = index;
                      setState(() {});
                  },

                ),
              ),


              Padding(
                padding: EdgeInsets.only(
                    top:  size.height*0.054,
                  left: size.width * 0.017,
                  right: size.width * 0.017,

                ),
                child: Row(
                  children: [
                     currentIndex != 0?
                       Expanded(
                         child: CustomNavButton(
                             title: "Back",
                             buttonClick: (){
                               pageController.previousPage(
                                   duration: const Duration(milliseconds: 500),
                                   curve: Curves.easeIn
                               );
                             },
                             alignment:  Alignment.centerLeft
                         ),
                       ): Expanded(child: const SizedBox()),

                    DotsWidget(
                        pagesCount: pages.length,
                        currentIndex: currentIndex,
                        onDotsClick: onDotClick,
                    ),


                    Expanded(
                      child: CustomNavButton(
                          title: currentIndex != pages.length -1 ?
                          "Next" :
                          "Finish",
                          buttonClick: () async {
                            if (currentIndex != pages.length - 1) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            } else {
                              await SharedPrefs.saveFirstTime(false);

                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.homeRoute,
                              );
                            }
                          },
                          alignment:  Alignment.centerRight
                      ),
                    )


                  ],
                ),
              )

            ],

          ),
        ),
      ),

    );
  }
  void onDotClick(int index){
    if(currentIndex != index){
      pageController.jumpToPage(index);
      /*pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn
      );*/
    }
  }
}
