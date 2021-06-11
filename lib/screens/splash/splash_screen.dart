import 'dart:async';
import '../HomePage/homepage_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../app/main_dependencies.dart';
import 'package:flare_flutter/flare_actor.dart';
//import 'package:grocerysystem/screens/Animation/FadeAnimation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () => HomePageScreen());
    Timer(
        Duration(seconds: 8),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor("assets/New File 1.flr",
          alignment: Alignment.center, fit: BoxFit.contain, animation: "intro"),
      backgroundColor: Colors.green[300],
    );
  }
}
