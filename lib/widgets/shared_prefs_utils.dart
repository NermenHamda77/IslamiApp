import 'package:islami_app/widgets/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefs{

  // todo: save data in shared prefs
  static Future<void> saveMostRecent(int newSuraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentStringIndexList =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    if (mostRecentStringIndexList.contains("$newSuraIndex")) {
      mostRecentStringIndexList.remove("$newSuraIndex");
    }
    mostRecentStringIndexList.insert(0, "$newSuraIndex");

    if (mostRecentStringIndexList.length > 5) {
      mostRecentStringIndexList.removeLast();
    }
    await prefs.setStringList(
      SharedPrefsKeys.mostRecentKey,
      mostRecentStringIndexList,
    );
  }

  static Future<void> saveFirstTime(bool isFirstTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefsKeys.isFirstOnboardingKey, isFirstTime);
  }

 static Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefsKeys.isFirstOnboardingKey) ?? true;
  }

}
