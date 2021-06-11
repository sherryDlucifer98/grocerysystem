import 'package:flutter/material.dart';
import 'package:grocerysystem/app/main_dependencies.dart';

class WelcomePage extends StatefulWidget {
  static const String route = "/WelcomePage";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("2A2AC0").withOpacity(controller.value),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              width: 300,
              height: 100,
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
