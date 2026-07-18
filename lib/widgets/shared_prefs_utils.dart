import 'package:islami_app/widgets/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

// todo: save data in shared prefs
Future<void> saveMostRecent(int newSuraIndex) async {
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
