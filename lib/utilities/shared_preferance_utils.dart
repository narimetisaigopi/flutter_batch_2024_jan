import 'package:flutter_batch_2024_jan/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharedPreferanceUtils {
  setSting(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  setUser() {}
  getUset() {}

  setLanguage(String value) async {
    await sharedPreferences.setString("language", value);
    Fluttertoast.showToast(msg: "Language set to ${value}");
  }

  getLanguage() async {
    return sharedPreferences.getString("language") ?? "";
  }

  bool isUserLoggedIn() {
    bool? data = sharedPreferences.getBool("isUserLogin");
    return data ?? false;
  }

  clearSP() {
    sharedPreferences.clear();
  }
}
