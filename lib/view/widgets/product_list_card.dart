import 'package:coffee_shop/view/screens/product_detail_screen.dart';
import 'package:coffee_shop/view/widgets/cached_network_mage.dart';
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productId: products[index].id,
            ),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
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
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$${products[index].price.toString()}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImageWidget(
                    imageUrl: products[index].pictureUrl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
