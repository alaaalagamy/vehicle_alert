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
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            alignment: Alignment.center,
            child: const Image(
              image:  AssetImage('assets/images/logo2.png'),
            ),
          ),
        )

    );
  }
}
