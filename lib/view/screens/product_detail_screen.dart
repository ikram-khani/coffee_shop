import 'package:coffee_shop/models/product_model.dart';
import 'package:coffee_shop/view/widgets/app_bar_widget.dart';
import 'package:coffee_shop/view/widgets/cached_network_mage.dart';
import 'package:coffee_shop/view/widgets/size_toggle_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/locale_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({required this.productId, super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  double _increasingFactor = 1;

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

  @override
  Widget build(BuildContext context) {
    List<Product> productsList =
        Provider.of<LocaleProvider>(context).getProducts();
    Product product =
        productsList.firstWhere((element) => element.id == widget.productId);
    double netProductPrice = product.price * _increasingFactor;

    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWidget(
        applocalization: AppLocalizations.of(context)!,
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
            child: SingleChildScrollView(
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                            setState(() {
                              _increasingFactor = size == 400
                                  ? 1.1429
                                  : size == 450
                                      ? 1.2858
                                      : 1;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '\$${netProductPrice.toStringAsFixed(2)}',
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
        ),
      ]),
    );
  }
}
