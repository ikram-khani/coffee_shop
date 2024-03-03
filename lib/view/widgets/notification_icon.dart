import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.notifications,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(-1, 1),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
