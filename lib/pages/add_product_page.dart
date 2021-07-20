import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class AddProductPage extends StatelessWidget {
  static const route = "/add-product";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(String title, String price, String imageUrl, String weight) {
      try {
        Provider.of<Products>(context, listen: false)
            .addProduct(title, price, imageUrl, weight)
            .then((value) => Navigator.pop(context));
      } catch (err) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error Occured"),
              content: Text("Error : $err"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OKAY"),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => save(titleController.text, priceController.text,
                imageUrlController.text, weightController.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Price",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: imageUrlController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Product Image Url",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Weight",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 0.0),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () => save(
                    titleController.text,
                    priceController.text,
                    imageUrlController.text,
                    weightController.text),
                child: Text(
                  "Add Product to Shop",
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
          ],
        ),
      ),
    );
  }
}
