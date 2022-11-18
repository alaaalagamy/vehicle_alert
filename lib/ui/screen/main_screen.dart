import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<State<StatefulWidget>> accountKey = GlobalKey();



  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
            child: Stack(children: [
              //align to top center using Container();
              Container(
                  alignment: Alignment.topCenter,
                  child: Image( image: AssetImage('assets/images/header.png'))),

              //Alignment at Center
              Container(
                alignment: Alignment.center,
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Settings",
                                style: TextStyle(fontSize: 17, color: Colors.red, fontFamily: 'comic'),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/settings.png')),
                                    ),
                                  ),
                                ),
                              ),


                              const SizedBox(height: 20,),


                              const Text(
                                "Contacts",
                                style: TextStyle(fontSize: 17, color: Colors.red, fontFamily: 'comic'),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/contacts.png')),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Information",
                                style: TextStyle(fontSize: 17, color: Colors.red, fontFamily: 'comic'),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/settings.png')),
                                    ),
                                  ),
                                ),
                              ),


                              const SizedBox(height: 20,),


                              const Text(
                                "History",
                                style: TextStyle(fontSize: 17, color: Colors.red, fontFamily: 'comic'),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/contacts.png')),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Bluetooth",
                                style: TextStyle(fontSize: 17, color: Colors.red, fontFamily: 'comic'),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/settings.png')),
                                    ),
                                  ),
                                ),
                              ),


                              const SizedBox(height: 20,),


                              const Text(
                                "Find Device",
                                style: TextStyle(fontSize: 17, color: Colors.red, fontFamily: 'comic'),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/contacts.png')),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //manual position with left, top, right, bottom
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                //you can use "right" and "bottom" too
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text(
                            'presets'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ])));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           SafeArea(
  //             child: Container(
  //                 padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
  //                 margin: const EdgeInsets.fromLTRB(20, 10, 20, 10), // This will be the login form
  //                 child: Column(
  //                   children: [
  //                     const Padding(
  //                       padding: EdgeInsets.all(20.0),
  //                       child: Image(
  //                           image: AssetImage('assets/images/header.png')
  //                       ),
  //                     ),
  //
  //                     const SizedBox(height: 20.0),
  //
  //
  //                     Row(
  //                           children: [
  //                             Column(
  //                               children: const [
  //                                 Text('Settings'),
  //                                 Image(image: AssetImage('assets/images/settings.png'))
  //                               ],
  //                             ),
  //                             Column(
  //                               children: const [
  //                                 Text('contacts'),
  //                                 Image(image: AssetImage('assets/images/contacts.png'))
  //                               ],
  //                             ),
  //                             Column(
  //                               children: const [
  //                                 Text('Bluetooth'),
  //                                 Image(image: AssetImage('assets/images/ble.png'))
  //                               ],
  //                             ),
  //
  //                           ],
  //                         )
  //                   ],
  //                 )),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


}
