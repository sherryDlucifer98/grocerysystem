import 'package:flutter/material.dart';
import '../../app/main_dependencies.dart';

class HomePageScreen extends StatefulWidget {
  static const String route = "/homepage_screen";
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    //creates the layout to our preference
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //provides the maximum width and height its children can take
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#26262F"),
                ),
              ),
              _buildColumn(),
            ],
          ),
        );
      },
    );
  }

  _buildColumn() {
    return Container(
      height: height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // we use spacer for more customized distribution of space, spacer will make the look of the widget to our likings and preference
          // we just add the instances of the widget and it will expand to make fill the remaining space available
          Spacer(),
          Hero(
            tag: 'logo',
            child: Container(
              width: width,
              height: 150,
              child: Image.asset(
                "assets/logo5.jpg",
                height: 300,
                width: width,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 135,
          ),
          //For signup screen to navigate to signup screen
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/signup_view");
            },
            child: Container(
              height: 0.075 * height,
              width: 0.8 * width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(60.0)),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login_view");
            },
            child: Container(
              height: 0.075 * height,
              width: 0.8 * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
