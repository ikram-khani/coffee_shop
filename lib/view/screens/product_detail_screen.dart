import 'package:coffee_shop/data/products_data.dart';
import 'package:coffee_shop/models/product_model.dart';
import 'package:coffee_shop/view/widgets/app_bar_widget.dart';
import 'package:coffee_shop/view/widgets/cached_network_mage.dart';
import 'package:coffee_shop/view/widgets/size_toggle_buttons.dart';
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
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 18,
                top: 15,
                bottom: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.category,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_outlined,
                              color: Color.fromRGBO(203, 159, 130, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    product.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(203, 159, 130, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(203, 159, 130, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromRGBO(242, 153, 74, 1),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(242, 153, 74, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '(${product.reviews})',
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Size',
                    style: TextStyle(color: Colors.white),
                  ),
                  Center(
                    child: SizeToggleButtons(
                        sizes: const [350, 400, 450],
                        onSelected: (size) {
                          print('selected size: $size');
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
