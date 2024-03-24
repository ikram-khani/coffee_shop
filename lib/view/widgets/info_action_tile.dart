import 'package:flutter/material.dart';

class InfoActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color iconBackgroundColor;
  const InfoActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: iconBackgroundColor,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
