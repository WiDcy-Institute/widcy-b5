
import 'package:shared_preferences/shared_preferences.dart';

class SharedRefUtil {

  Future<void> saveReference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
  }
  Future<String> getReference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
}
