import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products.dart';

import '../widgets/product_cart_item.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  static const route = "/cart-page";

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isLoading = true;
      Provider.of<Products>(context, listen: false)
          .inisialDataCart()
          .then((value) {
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
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text("My Cart"),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () => {},
          ),
        ],
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (prov.cartProduct.length == 0)
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
                  itemCount: prov.cartProduct.length,
                  itemBuilder: (context, i) => ProductCartItem(
                    prov.cartProduct[i].id,
                    prov.cartProduct[i].title,
                    prov.cartProduct[i].price,
                    prov.cartProduct[i].imageUrl,
                    //quantity
                  ),
                ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 32),
        child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context, Payment.route)},
          child: Text(
            "Proceed to Chechout Products",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
