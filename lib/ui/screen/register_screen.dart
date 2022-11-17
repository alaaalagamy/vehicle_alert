import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
                            image: AssetImage('assets/images/logo_small.png')
                        ),
                      ),


                      const SizedBox(height: 20.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: _emailController,

                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,

                                ),
                              ),

                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _emailController,

                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _emailController,

                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _emailController,

                                ),
                              ),
                              const SizedBox(height: 15.0),


                              Container(
                                child: TextField(

                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                child: ElevatedButton(
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
                                  onPressed: () {},
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
}
