import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  const CustomListTile({required this.leading, super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          leading,
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
