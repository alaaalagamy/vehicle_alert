import 'package:flutter/material.dart';
import 'package:vehicle_alert/ui/screen/login_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  const LoginScreen()), (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: [

              //align to top center using Container();
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
                child: Container(
                    alignment: Alignment.center,
                    child: Image( image: AssetImage('assets/images/logo2.png'))),
              ),



              //manual position with left, top, right, bottom
              const Align(
                alignment: Alignment.bottomCenter,
                child:  Image( image: AssetImage('assets/images/bottom.png'),height: 40,width: double.infinity,fit: BoxFit.fill,),
              ),


            ]));
  }

}
