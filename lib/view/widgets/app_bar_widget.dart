import 'package:coffee_shop/view/widgets/notification_icon.dart';
import 'package:coffee_shop/view/widgets/popup_menu_botton.dart';
import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class AppBarWidget extends PreferredSize {
  final BuildContext context;
  final bool isThereAutomaticallyImplyLeading;
  AppBarWidget(
      {required this.isThereAutomaticallyImplyLeading,
      super.key,
      required this.context})
      : super(
          child: AppBar(
            titleSpacing: isThereAutomaticallyImplyLeading ? 0 : 20,
            title: Text(
              'IK\'s Coffee Craze',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const NotificationIcon(),
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search_outlined),
                color: Theme.of(context).primaryColor,
              ),
              const PopupMenuButtonWidget()
            ],
          ),
          preferredSize: const Size.fromHeight(kToolbarHeight),
        );
}
