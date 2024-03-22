import 'package:coffee_shop/data/products_data.dart';
import 'package:coffee_shop/view/widgets/cached_network_mage.dart';
import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class CartItemCard extends StatefulWidget {
  final bool isThisFavoriteScreen;
  final int index;
  const CartItemCard(
      {this.isThisFavoriteScreen = false, required this.index, super.key});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final products = productsList;
    return InkWell(
      onTap: widget.isThisFavoriteScreen
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productId: products[widget.index].id,
                  ),
                ),
              );
            }
          : null,
      child: SizedBox(
        height: 100,
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 5,
              top: 5,
              bottom: 5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImageWidget(
                      imageUrl: products[widget.index].pictureUrl,
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceSize.width / 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        products[widget.index].category,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(
                        products[widget.index].name,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${products[widget.index].price.toString()}',
                        style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                widget.isThisFavoriteScreen
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Icon(
                          Icons.favorite,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                        ),
                      )
                    : Column(
                        children: [
                          Ink(
                            decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            height: 30,
                            width: 30,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                            ),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Ink(
                            width: 30,
                            height: 30,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
