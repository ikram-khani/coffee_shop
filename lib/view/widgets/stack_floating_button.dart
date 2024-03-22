import 'package:flutter/material.dart';

class StackFloatingButton extends StatelessWidget {
  final Function() onPressed;
  const StackFloatingButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromRGBO(255, 192, 157, 1),
            ),
            foregroundColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColor),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    '\$487',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Checkout',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Icon(Icons.arrow_forward,
                  size: 15, color: Theme.of(context).primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
