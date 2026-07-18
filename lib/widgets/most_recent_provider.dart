import 'package:flutter/widgets.dart';
import 'package:islami_app/widgets/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier{
  List<int> mostRecentList = [];

//todo : get saved data in shared prefs
  void getSavedMostRecent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentStringIndexList =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    mostRecentList = mostRecentStringIndexList
        .map((element) => int.parse(element))
        .toList();
   // return mostRecentIndices;
    notifyListeners();
  }

}