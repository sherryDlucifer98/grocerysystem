import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RowQuantity extends StatefulWidget {
  @override
  _RowQuantityState createState() => _RowQuantityState();
}

class _RowQuantityState extends State<RowQuantity> {
  int quantity = 1;

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new InkWell(
          child: new Icon(
            Icons.remove,
            size: 15,
          ),
          onTap: _decrement,
        ),
        new Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                new Text(quantity.toString(), style: TextStyle(fontSize: 20))),
        new InkWell(
          child: new Icon(
            Icons.add,
            size: 15,
          ),
          onTap: _increment,
        ),
      ],
    );
  }
}
