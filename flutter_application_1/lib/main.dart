import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/intro_page.dart';
import 'package:flutter_application_1/pages/shop_page.dart';
import 'package:flutter_application_1/theme/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro': (context) => const IntroPage(),
        '/shop': (context) => const ShopPage(),
        '/cart': (context) => const CartPage(),
      }
    );
  }
}
