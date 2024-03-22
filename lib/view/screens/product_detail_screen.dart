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
  int _quantity = 1;
  double _netProductPrice = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void updateNetPrice(double increasingFactor) {
    setState(() {
      _netProductPrice = _netProductPrice + increasingFactor;
    });
  }

  @override
  void initState() {
    Product product =
        productsList.firstWhere((element) => element.id == widget.productId);
    _netProductPrice = product.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product product =
        productsList.firstWhere((element) => element.id == widget.productId);
    _netProductPrice = _netProductPrice * _quantity;
    double priceFor50ml = product.price / 7;
    double priceFor100ml = priceFor50ml * 2;

    final deviceSize = MediaQuery.of(context).size;

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
                          if (size == 400) {
                            updateNetPrice(priceFor50ml);
                          }
                          if (size == 450) {
                            updateNetPrice(priceFor100ml);
                          }
                          print(_netProductPrice);
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '\$${_netProductPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: deviceSize.width / 3,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: _decrement,
                              icon: Icon(
                                Icons.remove,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                size: 18,
                              ),
                            ),
                            Text(
                              _quantity.toString(),
                              style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                            IconButton(
                              onPressed: _increment,
                              icon: Icon(
                                Icons.add,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).scaffoldBackgroundColor,
                          ),
                          foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor,
                          ),
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(
                              horizontal: deviceSize.width / 8,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'ADD TO CART',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
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
