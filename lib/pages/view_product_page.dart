import 'package:flutter/material.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

import '../widgets/product_view.dart';
import 'cart_page.dart';

class ViewProducts extends StatefulWidget {
  static const route = "/view-product";

  @override
  _ViewProductsState createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isLoading = true;
      Provider.of<Products>(context, listen: false).inisialData().then((value) {
        setState(() {
          isLoading = false;
        });
      }).catchError(
        (err) {
          print(err);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error Occured"),
                content: Text(err.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Okay"),
                  ),
                ],
              );
            },
          );
        },
      );

      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
              onPressed: () =>
                  Provider.of<Auth>(context, listen: false).logout(),
              icon: Icon(Icons.logout)),
          title: Text("All Products"),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.pushNamed(context, CartPage.route),
            ),
          ],
        ),
        body: (isLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (prov.allProduct.length == 0)
                ? Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2 / 3.51,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: prov.allProduct.length,
                    itemBuilder: (context, i) => ProductViewItem(
                      prov.allProduct[i].id,
                      prov.allProduct[i].title,
                      prov.allProduct[i].price,
                      prov.allProduct[i].imageUrl,
                      prov.allProduct[i].weight,
                    ),
                  ));
  }
}
