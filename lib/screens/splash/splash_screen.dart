import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () => HomePageScreen());
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: HexColor("#2A2AC0"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          width: width,
                          height: 150,
                          child: ColorFiltered(
                            child: Image.asset(
                              "assets/logo5.png",
                              height: 100,
                              width: width,
                              scale: 0.01,
                            ),
                            colorFilter: ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.color,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      SpinKitRipple(color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
