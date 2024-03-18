import 'package:coffee_shop/data/products_data.dart';
import 'package:coffee_shop/models/product_model.dart';
import 'package:coffee_shop/view/widgets/app_bar_widget.dart';
import 'package:coffee_shop/view/widgets/cached_network_mage.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({required this.productId, super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Product product =
        productsList.firstWhere((element) => element.id == widget.productId);
    return Scaffold(
      appBar: AppBarWidget(
        context: context,
        isThereAutomaticallyImplyLeading: true,
      ),
      body: Stack(children: [
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: CachedNetworkImageWidget(imageUrl: product.pictureUrl),
        ),
        Positioned.fill(
          top: 210,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(15, 10),
                topRight: Radius.elliptical(15, 10),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
