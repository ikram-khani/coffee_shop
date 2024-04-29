import 'package:coffee_shop/view/widgets/notification_icon.dart';
import 'package:coffee_shop/view/widgets/popup_menu_botton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class AppBarWidget extends PreferredSize {
  final BuildContext context;
  final AppLocalizations applocalization;
  final bool isThereAutomaticallyImplyLeading;
  AppBarWidget({
    required this.isThereAutomaticallyImplyLeading,
    super.key,
    required this.context,
    required this.applocalization,
  }) : super(
          child: AppBar(
            titleSpacing: isThereAutomaticallyImplyLeading ? 0 : 20,
            title: Text(
              applocalization.home_appbar_title,
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
