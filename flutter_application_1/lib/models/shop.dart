import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

class Shop extends ChangeNotifier{
  //prodeuct for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      description: "Description 1",
      price: 100,
      image: "assets/images/product1.jpg",
    ),
    Product(
      name: "Product 2",
      description: "Description 2",
      price: 200,
      image: "assets/images/product2.jpg",
    ),
    Product(
      name: "Product 3",
      description: "Description 3",
      price: 300,
      image: "assets/images/product3.jpg",
    ),
    Product(
      name: "Product 4",
      description: "Description 4",
      price: 400,
      image: "assets/images/product4.jpg",
    ),
    Product(
      name: "Product 5",
      description: "Description 5",
      price: 500,
      image: "assets/images/product5.jpg",
    ),
  ];

  //user cart
  List<Product> _cart = [

  ];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add product to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
