import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_alert/commons/api_client.dart';
import 'package:vehicle_alert/commons/objects/alert.dart';
import 'package:vehicle_alert/commons/objects/contact.dart';
import 'package:vehicle_alert/commons/shared_values.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey<State<StatefulWidget>> accountKey = GlobalKey();
  final ApiClient _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  List<Contact> contactsList = [];
  List<Alert> alertsList = [];

  @override
  void initState() {
    super.initState();
    getContacts();
    getAlerts();


  }

  void getAlerts() async {
    alertsList = await _client.getAlerts("Bearer ${SharedValues.token}",);
  }


  getContacts() async {
    contactsList = await _client.getContacts("Bearer ${SharedValues.token}",);
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
                                      AssetImage('assets/images/history.png')),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Alerts",
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
                        alertsListWidget(),
                        const SizedBox(height: 30),
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

  Widget alertsListWidget() {
    return alertsList.isNotEmpty
        ? SizedBox(
        height: 135,
        child: ListView(
            scrollDirection: Axis.vertical,
            children: alertsList.map((e) {
              String label = "";
              for (Contact contact in contactsList) {
                if(contact.id==e.id){
                  label = contact.first_name;
                      break ;
                }
              }

              return Container(
                margin: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Center(
                            child: Text(
                              label,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList()))
        : emptyListWidget();
  }


  Widget emptyListWidget() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: Text(
          'No Alerts yet',
          style: TextStyle( fontSize: 18,  fontFamily: 'comic' ,color: Colors.red),
        ),
      ),
    );
  }



}
