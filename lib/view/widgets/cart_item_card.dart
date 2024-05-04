import 'package:coffee_shop/view/widgets/cached_network_mage.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class CartItemCard extends StatelessWidget {
  final bool isThisFavoriteScreen;

  final int? productId;
  final String title;
  final String category;
  final String price;
  final String picUrl;
  final String? quantity;
  final Function()? onAddQuantity;
  final Function()? onSubQuantity;
  const CartItemCard({
    this.isThisFavoriteScreen = false,
    super.key,
    this.productId,
    required this.title,
    required this.category,
    required this.price,
    required this.picUrl,
    this.quantity,
    this.onAddQuantity,
    this.onSubQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: isThisFavoriteScreen
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productId: productId!,
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
                      imageUrl: picUrl,
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
                        category,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(
                        title,
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
                        '\$$price',
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
                isThisFavoriteScreen
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
                              onPressed: onAddQuantity,
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Ink(
                            width: 30,
                            height: 30,
                            child: IconButton(
                              onPressed: onSubQuantity,
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
