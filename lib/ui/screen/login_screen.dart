import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_alert/shared/componentes/componentes.dart';

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


  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'ali@sdc.com');
    _passwordController = TextEditingController(text: '123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
              children:  [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image(
                    image:  AssetImage('assets/images/header.png'),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          defaultFormField(
                              controller: _emailController,
                              type: TextInputType.emailAddress,
                              hint: 'email',
                              onType: (){}
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              controller: _passwordController,
                              type: TextInputType.visiblePassword,
                              isPassword: true ,
                              hint: 'password',
                              onType: (){},
                          )

                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Image(
                    image:  AssetImage('assets/images/bottom.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
      ),
    );
  }

}
