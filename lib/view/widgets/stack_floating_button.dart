import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StackFloatingButton extends StatelessWidget {
  final Function() onPressed;
  final AppLocalizations appLocalizations;
  final String totalAmount;

  const StackFloatingButton({
    required this.totalAmount,
    required this.onPressed,
    super.key,
    required this.appLocalizations,
  });

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
                    appLocalizations.total_text,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    '\$$totalAmount',
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
                appLocalizations.checkout_text,
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
