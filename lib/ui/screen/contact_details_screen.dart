import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
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
        body: Stack(
            children: [
          //align to top center using Container();
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
            child: Container(
                alignment: Alignment.topCenter,
                child: Image( image: AssetImage('assets/images/header.png'))),
          ),

          //Alignment at Center
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Container(
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
                            SizedBox(
                              height: 100,
                              child: Padding(
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
                            ),


                            const SizedBox(height: 20,),


                            const Text(
                              "Contacts",
                              style: TextStyle(fontSize: 17, color: Colors.red, fontFamily: 'comic'),
                            ),
                            const SizedBox(height: 5,),
                            SizedBox(
                              height: 100,
                              child: Padding(
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
                            SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/logo2.png')),
                                    ),
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
                            SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Material(
                                  color: Colors.white, // button color
                                  child: InkWell(
                                    splashColor: Colors.green, // splash color
                                    onTap: () {
                                    },
                                    child: const Image( image: AssetImage('assets/images/history.png')),
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
                            SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/ble.png')),
                                    ),
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
                            SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                      },
                                      child: const Image( image: AssetImage('assets/images/logo3.png')),
                                    ),
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
          ),

          //manual position with left, top, right, bottom
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            //you can use "right" and "bottom" too
            child: Image( image: AssetImage('assets/images/bottom.png')),

          ),

        ]));
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
