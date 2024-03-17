import 'package:flutter/material.dart';

class CustomMenuItem extends PopupMenuItem {
  final Widget leading;
  final Widget? divider;
  final String title;
  final VoidCallback onTaping;

  CustomMenuItem({
    super.key,
    this.divider,
    required this.onTaping,
    required this.leading,
    required this.title,
  }) : super(
          padding: EdgeInsets.zero,
          onTap: onTaping,
          height: 40,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 2,
                ),
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
              ),
              divider ?? const SizedBox(),
            ],
          ),
        );
}
