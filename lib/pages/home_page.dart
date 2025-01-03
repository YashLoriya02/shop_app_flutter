import 'package:flutter/material.dart';
import 'package:shoe_shop_flutter/pages/cart_page.dart';
import 'package:shoe_shop_flutter/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String selectedFilter;
  int currentPage = 0;

  List<Widget> pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 35), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 35), label: ""),
        ],
      ),
    );
  }
}
