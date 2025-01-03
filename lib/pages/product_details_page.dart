import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_flutter/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  void addToCart() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'size': selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromRGBO(45, 25, 45, .51),
          content: Center(
            child: Text(
              "Product added successfully.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromRGBO(45, 25, 45, .51),
          content: Center(
            child: Text(
              "Please select a size",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(widget.product['title'] as String,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(widget.product['imageUrl'] as String)),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(230, 230, 249, 1),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
              child: Column(
                children: [
                  Text(
                    "\$ ${widget.product['price']}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              side: BorderSide(
                                color: Color.fromRGBO(200, 200, 200, .25),
                              ),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : Color.fromRGBO(250, 250, 250, .25),
                              padding: EdgeInsets.only(
                                left: 14,
                                right: 14,
                                top: 10,
                                bottom: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: TextStyle(fontSize: 16),
                              label: Text(
                                '$size',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: addToCart,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
