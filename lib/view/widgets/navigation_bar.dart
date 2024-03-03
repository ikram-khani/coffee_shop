import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final void Function(int) onItemSelection;
  const CustomNavigationBar({required this.onItemSelection, super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentPageIndex = index;
            widget.onItemSelection(index);
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ]);
  }
}
