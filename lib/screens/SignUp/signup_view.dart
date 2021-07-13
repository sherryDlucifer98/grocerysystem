import 'package:flutter/material.dart';

import '../../app/main_dependencies.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Color _color = HexColor("#a2ad4c");
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
    return SafeArea(
      child: Theme(
        data: ThemeData(primaryColor: _color),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            height = constraints.maxHeight;
            width = constraints.maxWidth;
            return Scaffold(
              body: Container(
                height: height,
                width: width,
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
                    // Expanded(
                    //   child: Container(
                    //     width: width,
                    //     height: 150,
                    //     color: Colors.transparent,
                    //     child: Image.asset(
                    //       "assets/logo5.png",
                    //       height: 100,
                    //       width: width,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 45),
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
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 8),
                              _buildTextField("Email"),
                              _buildTextField("Password"),
                              _buildTextField("Username"),
                              _buildTextField("phone Number"),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {},
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(context, ""),
                                  child: Container(
                                    height: 0.060 * height,
                                    width: 0.5 * width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(color: _color),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: _color,
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 17),
                              GestureDetector(
                                onTap: () {},
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/login_view');
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.poppins(),
                                      children: [
                                        TextSpan(
                                          text: "Already have an account? ",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: " Sign In ",
                                          style: TextStyle(
                                            color: _color,
                                            fontWeight: FontWeight.bold,
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
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
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
