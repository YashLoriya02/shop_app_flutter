import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_flutter/pages/home_page.dart';
import 'package:shoe_shop_flutter/providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "Shopping App",
        theme: ThemeData(
            fontFamily: "Lato",
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(254, 206, 1, 1),
              primary: Color.fromRGBO(254, 206, 1, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
              titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 26),
            ),
            useMaterial3: true),
        // home: ProductDetailsPage(product: products[0]),
        home: HomePage(),
      ),
    );
  }
}
