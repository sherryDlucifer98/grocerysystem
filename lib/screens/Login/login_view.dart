import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/main_dependencies.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/LoginPage";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //color used in signUp now and login to match the colors somehow with the main color of the app
  Color _color = HexColor("a2ad4c");
  double height, width;
  //to checck the full size of the screen
  bool isFullScreen(Size currentSize, Size fullSize) {
    print("$fullSize == $currentSize");

    if (currentSize.height == fullSize.height &&
        fullSize.width == currentSize.width)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    //Theme for custome desgin, not overriding the main theme because i want diffirent theme here
    return Theme(
      data: ThemeData(primaryColor: _color),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          return Scaffold(
            body: Container(
              height: 400,
              decoration: BoxDecoration(
                color: HexColor("#a2ad4c"),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: isFullScreen(
                      Size(width, height),
                      Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                    )
                        ? 0.1 * height
                        : 0.2 * height,
                  ),
                  Expanded(
                    child: Container(
                      width: width,
                      height: 150,
                      color: Colors.transparent,
                      child: Image.asset(
                        "assets/logo5.jpg",
                        height: 100,
                        width: width,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: isFullScreen(
                      Size(width, height),
                      Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                    )
                        ? (0.05 * height)
                        : (0.025 * height),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.blue,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Enter your credentials",
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  color: Colors.black.withOpacity(0.675),
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(height: 12),
                            _buildTextField("Email"),
                            _buildTextField("Password"),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(context, "/"),
                                child: Container(
                                  height: 0.075 * height,
                                  width: 0.8 * width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(color: _color),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        color: _color,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signup_view');
                                },
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.poppins(),
                                    children: [
                                      TextSpan(
                                        text: "Don't have an account? ",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: " Sign Up now",
                                        style: TextStyle(color: _color),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildTextField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              left: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
