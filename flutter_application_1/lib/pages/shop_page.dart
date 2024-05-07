import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_drawer.dart';
import 'package:flutter_application_1/component/my_product_tile.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shop Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          //shop title
          // Text("SHOP"),
          //shop subtitle
          const SizedBox(height: 25),
          Center(
            child: Text(
            "Pick from a selected list of premium quality products",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,),
            ),
          ),
          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              final product = products[index];

              return MyProductTile(product: product);
            },
          ),
          ),
        ]
      ),
    );
  }
}
