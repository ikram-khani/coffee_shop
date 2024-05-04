import 'package:coffee_shop/view/widgets/cart_item_card.dart';
import 'package:coffee_shop/view/widgets/stack_floating_button.dart';
import 'package:coffee_shop/view_models/cart_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;

    final cartProvider = Provider.of<CartProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        title: Text(
          appLocalization.cart_title,
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
            itemCount: cartProvider.itemCount,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CartItemCard(
                  title: cartProvider.items.values.toList()[index].title,
                  price: cartProvider.items.values
                      .toList()[index]
                      .price
                      .toString(),
                  quantity: cartProvider.items.values
                      .toList()[index]
                      .quantity
                      .toString(),
                  category: cartProvider.items.values.toList()[index].category,
                  picUrl: cartProvider.items.values.toList()[index].picUrl,
                  onAddQuantity: () => cartProvider.incrementItemQuantity(
                    cartProvider.items.keys.toList()[index],
                  ),
                  onSubQuantity: () => cartProvider.decrementItemQuantity(
                    cartProvider.items.keys.toList()[index],
                  ),
                ),
              );
            },
          ),
          StackFloatingButton(
            totalAmount: cartProvider.totalAmount.toStringAsFixed(2),
            appLocalizations: appLocalization,
            onPressed: () => print('checkout successful'),
          ),
        ],
      ),
    );
  }
}
