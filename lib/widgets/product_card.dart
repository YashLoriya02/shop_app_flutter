import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageName;

  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(101, 0, 243, 0.20392156862745098)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 2),
            Text(
              '\$ $price',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 20),
            Center(
              child: Image(
                image: AssetImage(imageName),
                height: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
