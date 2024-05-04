import 'package:coffee_shop/view_models/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatefulWidget {
  final void Function(int) onItemSelection;
  final int currentPageIndex;
  const CustomNavigationBar(
      {required this.currentPageIndex,
      required this.onItemSelection,
      super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context);

    int currentIndex = widget.currentPageIndex;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.5), // Adjust opacity for shadow intensity
            blurRadius: 5.0, // Adjust blurRadius for shadow spread
            offset: const Offset(
                0.0, -2.0), // Adjust offset for shadow position (right, down)
          ),
        ],
        border: const Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: NavigationBar(
          height: 70,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
              widget.onItemSelection(index);
            });
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(
                Icons.home_outlined,
                size: 25,
              ),
              selectedIcon: const Icon(Icons.home),
              label: appLocalization!.bottom_navbar_item1,
            ),
            NavigationDestination(
              icon: Consumer<CartProvider>(
                builder: (context, cartProvider, child) => Badge(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  backgroundColor: Theme.of(context).primaryColor,
                  label: cartProvider.itemCount == 0
                      ? null
                      : Text(
                          cartProvider.itemCount.toString(),
                        ),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
              selectedIcon: const Icon(Icons.shopping_cart),
              label: appLocalization.bottom_navbar_item2,
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_outline),
              selectedIcon: const Icon(Icons.favorite),
              label: appLocalization.bottom_navbar_item3,
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_2_outlined),
              selectedIcon: const Icon(Icons.person_2),
              label: appLocalization.bottom_navbar_item4,
            ),
          ]),
    );
  }
}
