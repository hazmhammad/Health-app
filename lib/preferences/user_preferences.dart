
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();
  late SharedPreferences _sharedPreferences;

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future saveToken(String token) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setString('token', token);
  }

  Future setFirstVist() async {
    await _sharedPreferences.setBool('newUser', true);
  }

  bool get isLoggedIn => _sharedPreferences.getBool('logged_in') ?? false;
  bool get firstVist => _sharedPreferences.getBool('newUser') ?? false;


  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }


  String getToken(){
    String token = _sharedPreferences.getString("token") ?? "";
    return "$token";
    // return token;
  }
}
