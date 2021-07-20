import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  static const route = "/payment-page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(122, 207, 122, 1),
      ),
      body: Center(
        child: Text('YOUR PAYMENT HAS BEEN SUCCESSFULLY DONE'),
      ),
    );
  }
}
