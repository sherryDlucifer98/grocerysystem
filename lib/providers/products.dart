import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  String token, userId;

  void updateData(tokenData, uid) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  String urlMaster =
      "https://flutter-authentication-d5afe-default-rtdb.asia-southeast1.firebasedatabase.app/";
  List<Product> _allProduct = [];
  List<Product> get allProduct => _allProduct;

  List<Product_Cart> _cartProduct = [];
  List<Product_Cart> get cartProduct => _cartProduct;

  List<Product_Checkout> _checkoutProduct = [];
  List<Product_Checkout> get checkoutProduct => _checkoutProduct;

  Future<void> addProduct(
      String title, String price, String imageUrl, String weight) async {
    Uri url = Uri.parse("$urlMaster/products.json?auth=$token");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "imageUrl": imageUrl,
          "weight": weight,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product data = Product(
          id: json.decode(response.body)["name"].toString(),
          title: title,
          price: price,
          imageUrl: imageUrl,
          weight: weight,
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _allProduct.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  // for add to cart
  Future<void> addtoCart(
      String title, String price, String imageUrl, String weight) async {
    Uri url = Uri.parse("$urlMaster/cart.json?auth=$token");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "imageUrl": imageUrl,
          "weight": weight,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
          "userId": userId,
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product_Cart data = Product_Cart(
          id: json.decode(response.body)["name"].toString(),
          title: title,
          price: price,
          imageUrl: imageUrl,
          weight: weight,
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _cartProduct.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void editProduct(String id, String title, String price, String imageUrl,
      String weight) async {
    Uri url = Uri.parse("$urlMaster/products/$id.json?auth=$token");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "updatedAt": date.toString(),
          "imageUrl": imageUrl,
          "weight": weight,
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product edit = _allProduct.firstWhere((element) => element.id == id);
        edit.title = title;
        edit.price = price;
        edit.updatedAt = date;
        edit.imageUrl = imageUrl;
        edit.weight = weight;
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void deleteProduct(String id) async {
    Uri url = Uri.parse("$urlMaster/products/$id.json?auth=$token");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _allProduct.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void deleteProductCart(String id) async {
    Uri url = Uri.parse("$urlMaster/cart/$id.json?auth=$token");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _cartProduct.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  Product selectById(String id) {
    return _allProduct.firstWhere((element) => element.id == id);
  }

  Future<void> inisialData() async {
    _allProduct = [];
    Uri url = Uri.parse("$urlMaster/products.json?auth=$token");

    try {
      var response = await http.get(url);

      print(response.statusCode);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;
        if (data != null) {
          data.forEach(
            (key, value) {
              Product prod = Product(
                id: key,
                title: value["title"],
                price: value["price"],
                imageUrl: value["imageUrl"],
                weight: value["weight"],
                createdAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
                updatedAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["updatedAt"]),
              );
              _allProduct.add(prod);
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }

  Future<void> inisialDataCart() async {
    _cartProduct = [];
    Uri url = Uri.parse(
        '$urlMaster/cart.json?auth=$token&orderBy="userId"&equalTo="$userId"');

    try {
      var response = await http.get(url);

      print(response.statusCode);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;
        if (data != null) {
          data.forEach(
            (key, value) {
              Product_Cart cart = Product_Cart(
                id: key,
                title: value["title"],
                price: value["price"],
                imageUrl: value["imageUrl"],
                weight: value["weight"],
                createdAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
                updatedAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["updatedAt"]),
              );
              _cartProduct.add(cart);
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }

  Future<void> addCartToCheckout(
      String title, String price, String imageUrl, String quantity) async {
    Uri url = Uri.parse("$urlMaster/checkout.json?auth=$token");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "imageUrl": imageUrl,
          "quantity": quantity,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product_Checkout data = Product_Checkout(
          id: json.decode(response.body)["name"].toString(),
          title: title,
          price: price,
          imageUrl: imageUrl,
          quantity: quantity,
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _checkoutProduct.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }
}
