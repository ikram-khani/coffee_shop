import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/data/products_data.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductsListView extends StatelessWidget {
  final String category;
  const ProductsListView({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryWiseProducts =
        productsList.where((element) => element.category == category).toList();

    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: categoryWiseProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
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
                              categoryWiseProducts[index].category,
                              style: const TextStyle(fontSize: 10),
                            ),
                            Text(
                              categoryWiseProducts[index].name.toUpperCase(),
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
                              imageUrl: categoryWiseProducts[index].pictureUrl,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
