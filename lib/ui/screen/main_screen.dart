import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:vehicle_alert/ui/screen/contacts_screen.dart';
import 'package:vehicle_alert/ui/screen/history_screen.dart';
import 'package:vehicle_alert/ui/screen/settings_screen.dart';


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
                              height: 90,
                              width: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const SettingsScreen()),
                                        );
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
                              height: 90,
                              width: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const ContactsScreen()),
                                        );
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
                              height: 90,
                              width: 90,
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
                              height: 90,
                              width: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Material(
                                  color: Colors.white, // button color
                                  child: InkWell(
                                    splashColor: Colors.green, // splash color
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HistoryScreen()),
                                      );
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
                              height: 90,
                              width: 90,
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
                              height: 90,
                              width: 90,
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
              const Align(
                alignment: Alignment.bottomCenter,
                child:  Image( image: AssetImage('assets/images/bottom.png'),height: 40,width: double.infinity,fit: BoxFit.fill,),
              ),


        ]));
  }

}
