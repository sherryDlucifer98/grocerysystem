import 'package:flutter/material.dart';
import '../../app/main_dependencies.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  static const String route = "/WelcomePage";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

//we have to add SingleTickerProviderStateMixin to activate the ticker
class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  //Animation
  AnimationController controller;

  //for curved animation
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
      backgroundColor: HexColor("BFBFEC").withOpacity(controller.value),
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
              child: Image.asset(
                "assets/logo5.jpg",
                height: 150,
                width: 200,
              ),
            ),
          ),
          TypewriterAnimatedTextKit(
            text: ["𝓜𝓐𝓥𝓔𝓡𝓘𝓒𝓚"],
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          const Text(
            "MAVERICK (grocery app) This App is designed and developed to ease the interaction between buyer and seller , numerous features are included in maverick to suppert interaction between buyer and sellers So what are you waiting for Let's start.",
            style:
                TextStyle(color: Colors.black, fontSize: 16, wordSpacing: 1.8),
            textAlign: TextAlign.center,
            // softWrap: true,
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 60,
            width: 240,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/homepage_screen");
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white.withOpacity(0.25)),
                child: Center(
                  child: const Text(
                    "Let's start",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
