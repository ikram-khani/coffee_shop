import 'package:flutter/material.dart';

class CartBadge extends StatelessWidget {
  final IconData icon;
  const CartBadge({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Badge(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      backgroundColor: Colors.green,
      label: const Text('1'),
      child: Icon(icon),
    );
  }
}
