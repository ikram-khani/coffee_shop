import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String titleText;
  final String valueText;
  const InfoTile({required this.titleText, required this.valueText, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          valueText,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
