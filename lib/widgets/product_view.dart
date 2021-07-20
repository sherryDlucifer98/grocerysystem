import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductViewItem extends StatelessWidget {
  final String id, title, price, imageUrl, weight;

  ProductViewItem(this.id, this.title, this.price, this.imageUrl, this.weight);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 1.2;
    double fontSize = (height / 24).round().toDouble();
    var prov = Provider.of<Products>(context, listen: false);
    return new GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(context, EditProductPage.route, arguments: id);
      // },
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
                      new Text(
                        "$weight g",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: fontSize * 0.48),
                      ),
                      new Container(
                          margin:
                              EdgeInsets.only(top: 10, bottom: 3, left: 120),
                          child: new IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              prov.addtoCart(title, price, imageUrl, weight);
                            },
                          ))
                    ]))
          ],
        ),
      ),
    );
  }
}
