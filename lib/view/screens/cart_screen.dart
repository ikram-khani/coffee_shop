import 'package:coffee_shop/data/products_data.dart';
import 'package:coffee_shop/view/widgets/cart_item_card.dart';
import 'package:coffee_shop/view/widgets/stack_floating_button.dart';
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
        toolbarHeight: 50,
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CartItemCard(index: index),
              );
            },
          ),
          StackFloatingButton(
            onPressed: () => print('checkout successful'),
          ),
        ],
      ),
    );
  }
}
