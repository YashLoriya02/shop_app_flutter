import 'package:flutter/material.dart';
import 'package:shoe_shop_flutter/global_variable.dart';
import 'package:shoe_shop_flutter/pages/product_details_page.dart';
import 'package:shoe_shop_flutter/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    "All",
    "Adidas",
    "Nike",
    "Bata",
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      side: BorderSide(
                        color: Color.fromRGBO(200, 200, 200, .25),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromRGBO(200, 200, 200, .5),
                      padding: EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: TextStyle(fontSize: 16),
                      label: Text(
                        filter,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ProductDetailsPage(product: product);
                          }),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        imageName: product['imageUrl'] as String,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
