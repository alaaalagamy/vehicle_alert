import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../commons/api_client.dart';
import '../../commons/theme_helper.dart';
import 'main_screen.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final double _headerHeight = 250;
  String errorMessage = "";
  final Key _formKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;

  final ApiClient _clien = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  final sendDataSignup = SendDataSignup();
  late var userLoginResponse = UserLoginResponse();



  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        child: Image(
                            image: AssetImage('assets/images/header.png')
                        ),
                      ),



                      const SizedBox(height: 20.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: userNameController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Enter your user name'),
                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                ),
                              ),

                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: emailController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Email', 'Enter your email'),
                                ),
                              ),

                              const SizedBox(height: 15.0),

                              Container(
                                decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'REGISTER'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  // onPressed: () {},
                                    onPressed: () async {

                                      sendDataSignup.username = userNameController.text;
                                      sendDataSignup.password = passwordController.text;
                                      sendDataSignup.email = emailController.text;
                                      // _UserLoginResponse = await loginUser();
                                      userLoginResponse = await signUpUser();

                                      print(userLoginResponse.user?.fullname);

                                      // if (userLoginResponse.user?.token != null) {
                                      //   print(userLoginResponse.user?.token) ;
                                      //   // Amr change here, I will save the token as a global variable to access it from different places
                                      //   // SharedValues.user = userLoginResponse.user;
                                      //   // SharedValues.userEmail = sendDataLogin.userName;
                                      //   // SharedValues.userPass = sendDataLogin.password;
                                      //
                                      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                                      // } else {
                                      //   Fluttertoast.showToast(
                                      //       msg: "Error : $errorMessage",
                                      //       toastLength: Toast.LENGTH_SHORT,
                                      //       gravity: ToastGravity.BOTTOM,
                                      //       timeInSecForIosWeb: 1,
                                      //       backgroundColor: const Color(0xff707070),
                                      //       textColor: Colors.white,
                                      //       fontSize: 18.0);
                                      //   //x = _UserLoginResponse.Message.toString();
                                      // }
                                    }
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


  Future<UserLoginResponse> signUpUser() async {
    return await _clien.addUser(sendDataSignup).then((value) => userLoginResponse = value).catchError((e) {
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

