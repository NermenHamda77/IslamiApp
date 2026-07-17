import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadeeth_details_screen.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadeeth_item.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_details/sura_details_screen.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      routes: {
        AppRoutes.homeRoute : (context) => HomeScreen(),
        AppRoutes.suraDetailsRoute : (context) => SuraDetailsScreen(),
        AppRoutes.hadeethDetailsScreenRoute : (context) => HadeethDetailsScreen(),

      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

    );
  }
}

