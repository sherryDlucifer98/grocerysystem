import 'package:flutter/widgets.dart';
import 'main_dependencies.dart';
import 'package:flutter/material.dart';

Route<dynamic> createRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/splash_screen":
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case "/welcome_screen":
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case "/homepage_screen":
      return MaterialPageRoute(builder: (context) => HomePageScreen());
    case "/login_view":
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case "/signup_view":
      return MaterialPageRoute(builder: (context) => SignUpScreen());
  }
  return null;
}
