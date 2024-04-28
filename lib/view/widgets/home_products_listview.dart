import 'package:coffee_shop/data/products_data_en.dart';
import 'package:coffee_shop/view/widgets/product_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../view_models/products_data_provider.dart';

class HomeProductsListView extends StatelessWidget {
  final String category;
  const HomeProductsListView({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> productsList =
        Provider.of<ProductsDataProvider>(context).getProducts();
    final List<Product> categoryWiseProducts =
        productsList.where((element) => element.category == category).toList();

    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
          itemCount: categoryWiseProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ProductListCard(
                index: index,
                products: categoryWiseProducts,
              ),
            );
          },
        ),
      ),
    );
  }
}
