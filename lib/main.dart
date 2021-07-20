import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';

// import './pages/home_page.dart';
import './pages/auth_page.dart';
import './pages/home_page.dart';
import './pages/add_product_page.dart';
import './pages/edit_product_page.dart';
import './pages/view_product_page.dart';
import '../pages/cart_page.dart';
import '../pages/checkout_page.dart';
import 'providers/auth.dart';
import '../pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products(),
          update: (context, auth, products) =>
              products..updateData(auth.token, auth.userId),
        ),
      ],
      builder: (context, child) => Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: auth.isAuth ? HomePage() : LoginPage(), this is to login to the buyer part to do the buyer features
          home: auth.isAuth ? ViewProducts() : LoginPage(), //splash()
          routes: {
            AddProductPage.route: (ctx) => AddProductPage(),
            ViewProducts.route: (ctx) => ViewProducts(),
            CartPage.route: (ctx) => CartPage(),
            EditProductPage.route: (ctx) => EditProductPage(),
            Payment.route: (ctx) => Payment(),
          },
        ),
      ),
    );
  }
}
