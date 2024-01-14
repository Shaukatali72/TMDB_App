import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPrefs? instance;

  SharedPrefs._();

  SharedPrefs.init() {
    instance ??= SharedPrefs._();
  }
  late final SharedPreferences _prefs;
  static Future<void> getPref() async {
    instance?._prefs = await SharedPreferences.getInstance();
  }

  Future<void> clearPreference() async {
    await instance?._prefs.clear();
  }

  bool checkLogin() {
    return instance?._prefs.getString('email') == null ? true : false;
  }

  Future<void> setUserName(String dataOfUser) async {
    await instance?._prefs.setString('username', dataOfUser);
  }

  Future<void> setEmail(String emailData) async {
    await instance?._prefs.setString('email', emailData);
  }

  Future<void> setProfileImage(String profileData) async {
    await instance?._prefs.setString('profile', profileData);
  }

  String? getUserName() {
    return instance?._prefs.getString('username');
  }

  String? getEmail() {
    return instance?._prefs.getString('email');
  }

  String? getProfileImage() {
    return instance?._prefs.getString('profile');
  }
}
