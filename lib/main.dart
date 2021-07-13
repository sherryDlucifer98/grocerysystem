import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './app/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      //onGenerateRoute:RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash_screen",
      onGenerateRoute: router.createRoute,
    );
  }
}
