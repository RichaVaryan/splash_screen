import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "model/loginModel.dart";
import 'shared_preferences.dart';
import 'login_response.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://be.mbkm-si.stechoq.com";

Future<LoginResponse?> requestLogin(String nisp, String password) async {
  try {
    const String apiURL = '$baseUrl/api/login';
    const int roleID = 1;

    var response = await http.post(Uri.parse(apiURL),
        body: {"nisp": nisp, "password": password, "role_id": roleID});

    debugPrint("Api Request -> login : $nisp | $password");
    debugPrint("Api Response -> login : ${response.body.toString()}");

    final LoginResponse? loginResponse =
        LoginResponse.fromObject(response.body);

    if (loginResponse?.status == true) {
      //save token
      Preferences.saveLogin(LoginModel(
          nisp: nisp, token: loginResponse?.data?.token, roleId: roleID));
    }

    return loginResponse;
  } catch (e) {
    debugPrint("Api Response -> login error : $e.toString()");
  }
  return null;
}
