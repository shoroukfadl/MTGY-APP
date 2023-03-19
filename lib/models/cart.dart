import 'package:flutter/material.dart';
import 'package:mtgy_app/models/product.dart';
class Cart {
  final Service product;
  final int numOfpeople;

  Cart({required this.product, required this.numOfpeople});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoServices[0], numOfpeople: 2),
  Cart(product: demoServices[1], numOfpeople: 1),
  Cart(product: demoServices[2], numOfpeople: 1),
  Cart(product: demoServices[3], numOfpeople: 1),
  Cart(product: demoServices[4], numOfpeople: 2),
  Cart(product: demoServices[5], numOfpeople: 1),
  Cart(product: demoServices[6], numOfpeople: 1),
  Cart(product: demoServices[7], numOfpeople: 1),
];