import 'package:flutter/material.dart';

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
            const NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                size: 25,
              ),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: Theme.of(context).primaryColor,
                label: const Text('1'),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              selectedIcon: const Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            const NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            const NavigationDestination(
              icon: Icon(Icons.person_2_outlined),
              selectedIcon: Icon(Icons.person_2),
              label: 'Profile',
            ),
          ]),
    );
  }
}
