import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingItemTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String? trailingText;
  const SettingItemTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      leading: Icon(leadingIcon),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null) ...[
            Text(
              trailingText!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
          ],
          const Icon(
            CupertinoIcons.forward,
            size: 16,
          ),
        ],
      ),
    );
  }
}
