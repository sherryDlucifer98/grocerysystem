import 'package:flutter/material.dart';

class Product {
  String id, title, price, imageUrl, weight;
  DateTime createdAt, updatedAt;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.weight,
    @required this.createdAt,
    this.updatedAt,
  });
}

class Product_Cart {
  String id, title, price, imageUrl, weight;
  DateTime createdAt, updatedAt;

  Product_Cart({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.weight,
    @required this.createdAt,
    this.updatedAt,
  });
}

class Product_Checkout {
  String id, title, price, imageUrl, quantity;
  DateTime createdAt, updatedAt;

  Product_Checkout({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.quantity,
    @required this.createdAt,
    this.updatedAt,
  });
}
