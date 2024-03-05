import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductListCard extends StatelessWidget {
  final int index;
  final List<Product> products;
  const ProductListCard({
    required this.index,
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(255, 245, 233, 1),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products[index].category,
                    style: const TextStyle(fontSize: 10),
                  ),
                  Text(
                    products[index].name.toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 500),
                    placeholderFadeInDuration:
                        const Duration(milliseconds: 300),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          color: Colors.grey[300],
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.grey[200]!),
                          ),
                        ),
                    imageUrl: products[index].pictureUrl,
                    errorWidget: (context, url, error) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
