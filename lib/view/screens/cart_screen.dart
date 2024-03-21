import 'package:coffee_shop/data/products_data.dart';
import 'package:coffee_shop/view/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: const Icon(Icons.delete),
            disabledColor: Colors.grey,
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CartItemCard(index: index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 20,
              bottom: 8,
              top: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '\$234352',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 40),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(255, 245, 233, 1),
                    ),
                    foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {},
                  child: const Text('Checkout ->'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
