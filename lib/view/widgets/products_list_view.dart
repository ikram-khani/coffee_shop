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
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(categoryWiseProducts[index].category),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(categoryWiseProducts[index].name),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey,
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
