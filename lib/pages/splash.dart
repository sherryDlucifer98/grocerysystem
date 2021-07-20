import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../pages/auth_page.dart';
import '../pages/Animation/FadeAnimation.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
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
