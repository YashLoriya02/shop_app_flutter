import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_flutter/providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Cart"),
          ),
        ),
        body: cart.isNotEmpty
            ? ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final product = cart[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(product['imageUrl'] as String),
                        radius: 30,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Delete Product',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                content: const Text(
                                  'Are you sure you want to remove the product from your cart?',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'No',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .removeProduct(product);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      title: Text(
                        product['title'].toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        'Size: ${product['size']}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "Cart is Empty",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ));
  }
}
