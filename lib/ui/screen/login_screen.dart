import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_alert/ui/screen/register_screen.dart';

import '../../commons/api_client.dart';
import '../../commons/shared_values.dart';
import '../../commons/theme_helper.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = "";
  final Key _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool pressed = false;
  final ApiClient _clien = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  final sendDataLogin = SendDataLogin();
  late var userLoginResponse = UserLoginResponse();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'msh');
    _passwordController = TextEditingController(text: '123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10), // This will be the login form
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image( image: AssetImage('assets/images/header.png')),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: TextField(
                              controller: _emailController,
                              decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your name'),

                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: TextField(
                              controller: _passwordController,
                              decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                              obscureText: true,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            width: double.infinity,
                            child: ElevatedButton(
                                child: Text(
                                  'Sign In'.toUpperCase(),
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                // onPressed: () {},
                                onPressed: () async {
                                  print(_emailController.text);
                                  print(_passwordController.text);
                                  // print(isChecked);

                                  sendDataLogin.username = _emailController.text;
                                  sendDataLogin.password = _passwordController.text;
                                  // _UserLoginResponse = await loginUser();
                                  userLoginResponse = await loginUser();

                                  print(userLoginResponse.user?.fullname);
                                  print(userLoginResponse.token);

                                  if (userLoginResponse.token != null) {
                                    // Amr change here, I will save the token as a global variable to access it from different places
                                     SharedValues.token = userLoginResponse.token;
                                    // SharedValues.userEmail = sendDataLogin.userName;
                                    // SharedValues.userPass = sendDataLogin.password;

                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Error : $errorMessage",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: const Color(0xff707070),
                                        textColor: Colors.white,
                                        fontSize: 18.0);
                                    //x = _UserLoginResponse.Message.toString();
                                  }
                                }
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterScreen()),
                                );
                              },
                              child: Text(
                                "no account ? signup".toUpperCase(),
                                style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic'),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )),

          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child:  Image( image: AssetImage('assets/images/bottom.png'),height: 40,width: double.infinity,fit: BoxFit.fill,),
            ),
          ),

        ],
      ),
    );
  }

  Future<UserLoginResponse> loginUser() async {
    return await _clien.loginUser(sendDataLogin).then((value) => userLoginResponse = value).catchError((e) {
      int errorCode = 0;
      errorMessage = "";
      switch (e.runtimeType) {
        case DioError:
          final res = (e as DioError).response;
          if (res != null) {
            errorCode = res.statusCode!;
            errorMessage = res.statusMessage!;
          } else {
            print("error ${e.message}");
          }
          print(errorCode);
          print(errorMessage);
          return userLoginResponse;
        default:
      }
    });
  }
}
