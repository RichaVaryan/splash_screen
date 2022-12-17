import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "model/loginModel.dart";
import 'shared_preferences.dart';
import 'login_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:splash_screen/mainpage.dart';
import 'package:http/http.dart' as http;

//Api Login
Future<LoginResponse?> requestLogin(String nisp, String password) async {
  try {
    const String apiURL = 
        'http://localhost:8080/api/login';

    var response = await http.post(Uri.parse(apiURL), body: {
      "nisp": nisp,
      "password": password,
    });

    debugPrint("Api Request -> login : $nisp | $password");
    debugPrint("Api Response -> login : ${response.body.toString()}");

    final LoginResponse? loginResponse =
        LoginResponse.fromObject(response.body);

    if (response.statusCode == 200 && loginResponse?.data != null) {
      //save token
      Preferences.saveLogin(LoginModel(nisp: nisp, password: password))
      Preferences.saveAuth(loginResponse?.data);
    }

    return loginResponse;
  } catch (e) {
    debugPrint("Api Response -> login error : $e.toString()");
  }
  return null;
}

Future<AuthState> getAuthState() async{
  
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //title
                Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 50),
//dalam kotak ungu
                Container(
                  height: 190,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NISP',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'NISP',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      //paswword
                      Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                //tombol login
                const SizedBox(
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 300,
                        height: 40,
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF7986CB),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => mainpage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //diluar kotak ungu
                SizedBox(height: 100),
                Image.asset(
                  'assets/images/App.png',
                  height: 100.0,
                  width: 100.0,
                ),
              ],
            ),
          ),
        ));
  }
}
