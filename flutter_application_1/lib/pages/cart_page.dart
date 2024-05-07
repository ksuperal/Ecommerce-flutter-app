import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_button.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    void removeItemFromCart(BuildContext context, Product product) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  'Would you like to remove ${product.name} from your cart?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          });
    }

    void payButtonPressed(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Would you like to pay for the items in your cart?'),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().cart.clear();
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Cart Page'),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            //cart list
            Expanded(
                child: cart.isEmpty
                ? const Center(child:Text("Cart is empty..."))
                :ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      removeItemFromCart(context, item);
                    },
                  ),
                );
              },
            )),
            //pay button
            Padding(
              padding: const EdgeInsets.all(50),
              child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.payment), // Add your desired icon here
                    SizedBox(width: 10), // Adjust the spacing between the icon and text as needed
                    Text('Pay'),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
