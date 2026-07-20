import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadeeth_details_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_details/sura_details_screen.dart';
import 'package:islami_app/ui/onboarding/onboarding_screen.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:islami_app/widgets/most_recent_provider.dart';
import 'package:islami_app/widgets/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isFirst = await SharedPrefs.isFirstTime();

  runApp( ChangeNotifierProvider(
    create: (context)=> MostRecentProvider(),
      child: MyApp(isFirstTime: isFirst,)));

}

class MyApp extends StatelessWidget {
  bool isFirstTime;
   MyApp({super.key , required this.isFirstTime});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isFirstTime ?
      AppRoutes.onboardingScreenRoute:
      AppRoutes.homeRoute,
      routes: {
        AppRoutes.homeRoute : (context) => HomeScreen(),
        AppRoutes.suraDetailsRoute : (context) => SuraDetailsScreen(),
        AppRoutes.hadeethDetailsScreenRoute : (context) => HadeethDetailsScreen(),
        AppRoutes.onboardingScreenRoute : (context) => OnboardingScreen(),

      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

    );
  }
}

