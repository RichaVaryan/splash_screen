import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import "model/loginModel.dart";

class Preferences{
  static Future<void> saveLogin(LoginModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    var jsonValue = jsonEncode(data.toJson());
    prefs.setString('LOGIN', jsonValue);
  }

  static Future<LoginModel?> getLogin() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('LOGIN');
    if (data != null){
      var jsonObject = jsonDecode(data);
      return LoginModel.fromJson(jsonObject);
    }
  }

  static Future<void> clearLogin() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.remove('LOGIN');
  }
}