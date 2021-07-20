import 'package:flutter/material.dart';
import 'package:flutter_firebase/widgets/cart_widgets/row_for_cart.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductCartItem extends StatelessWidget {
  final String id, title, price, imageUrl;

  ProductCartItem(this.id, this.title, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Products>(context, listen: false);

    double height = MediaQuery.of(context).size.height / 1.2;
    double fontSize = (height / 24).round().toDouble();
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Center(
                child: new Hero(
                    tag: () {},
                    child: Image.network(
                      "$imageUrl",
                      fit: BoxFit.cover,
                      height: height * 0.20,
                    ))),
            new Container(
                height: height * 0.25,
                margin: EdgeInsets.only(top: 10),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "\RM $price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: fontSize),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: new Text("$title",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: fontSize * 0.65)),
                      ),
                      new Container(
                          child: new Row(
                        children: <Widget>[
                          new RowQuantity(),
                          new IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              prov.deleteProductCart(id);
                            },
                          )
                        ],
                      )),
                    ]))
          ],
        ),
      ),
    );
  }
}
