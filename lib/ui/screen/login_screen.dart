import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../commons/api_client.dart';
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
    _emailController = TextEditingController(text: 'admin2@sdc.com');
    _passwordController = TextEditingController(text: '123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Image( image: AssetImage('assets/images/logo_small.png')),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: TextField(
                                  controller: _emailController,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: TextField(
                                  controller: _passwordController,
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

                                      sendDataLogin.userName = _emailController.text;
                                      sendDataLogin.password = _passwordController.text;
                                      // _UserLoginResponse = await loginUser();
                                      userLoginResponse = await loginUser();

                                      print(userLoginResponse.user?.token);

                                      if (userLoginResponse.user?.token != null) {
                                        // Amr change here, I will save the token as a global variable to access it from different places
                                        // SharedValues.user = userLoginResponse.user;
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
                                  onTap: () {},
                                  // onTap: () {
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             ForgotPasswordPage()),
                                  //   );
                                  // },
                                  child: Text(
                                    "Forgot password?".toUpperCase(),
                                    style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic'),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
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
