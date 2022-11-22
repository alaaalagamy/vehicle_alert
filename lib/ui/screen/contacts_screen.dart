import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:vehicle_alert/commons/api_client.dart';
import 'package:vehicle_alert/commons/objects/contact.dart';
import 'package:vehicle_alert/ui/screen/settings_screen.dart';

import '../../commons/shared_values.dart';


class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final GlobalKey<State<StatefulWidget>> accountKey = GlobalKey();
  final ApiClient _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  List<Contact> contactsList = [];


  @override
  void initState() {
    getContacts();
    super.initState();
  }

  getContacts() async {
    contactsList = await _client.getContacts("Bearer ${SharedValues.token}",);
    for (final x in contactsList){
      print(x.first_name);
    }
  }



  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
          onWillPop: () async => false,
          child:  Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Image(image: AssetImage('assets/images/header.png')),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.green, // splash color
                                  onTap: () {},
                                  child: const Image(
                                      image:
                                      AssetImage('assets/images/contacts.png')),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Favorite Contacts",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'comic'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                    child: Column(
                      children: [
                        iconBtnRow(
                            assetImgPath: 'assets/images/heart.png',
                            btnString: 'Contact 1'),
                        iconBtnRow(
                            assetImgPath: 'assets/images/heart.png',
                            btnString: 'Contact 2'),
                        iconBtnRow(
                            assetImgPath: 'assets/images/heart.png',
                            btnString: 'Contact 3'),
                        iconBtnRow(
                            assetImgPath: 'assets/images/heart.png',
                            btnString: 'Contact 4'),
                        iconBtnRow(
                            assetImgPath: 'assets/images/heart.png',
                            btnString: 'Contact 5'),

                      ],
                    )
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: ButtonStyle(
                        alignment: AlignmentDirectional.centerStart,
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(width : 3 , color: Colors.red)))),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 40),
                      child: Text(
                        'Back'.toUpperCase(),
                        style: const TextStyle( fontSize: 16,
                            fontFamily: 'comic' , color: Colors.red),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),

                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage('assets/images/bottom.png'),
                    height: 40,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          )
      );
  }

  Widget iconBtnRow({required String assetImgPath, required String btnString}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Material(
                color: Colors.white, // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()),
                    );
                  },
                  child: Image(image: AssetImage(assetImgPath)),
                ),
              ),
            ),
          ),

          Expanded(
            child: TextButton(
              style: ButtonStyle(
                  alignment: AlignmentDirectional.centerStart,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(color: Colors.black)))),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  btnString,
                  style: const TextStyle( fontSize: 16, color: Colors.black),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
