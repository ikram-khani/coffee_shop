import 'package:coffee_shop/view/screens/profile_screen.dart';
import 'package:coffee_shop/view/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // To get the system padding using MediaQuery
    var systemPadding = MediaQuery.of(context).padding;
    // To get the app bar height using the AppBar widget
    var appBarHeight = AppBar().preferredSize.height;

    // And to calculate the combined height of AppBar and system UI
    double appBarWithSystemUIHeight = appBarHeight + systemPadding.top;

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: appBarWithSystemUIHeight - 10),
        width: 160,
        height: 180,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          backgroundColor: const Color.fromRGBO(255, 245, 233, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomListTile(
                leading: const Icon(Icons.person),
                title: 'Profile',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),
              const Divider(),
              CustomListTile(
                leading: const Icon(Icons.settings_outlined),
                title: 'Settings',
                onTap: () {},
              ),
              const Divider(),
              CustomListTile(
                leading: const Icon(Icons.help_outline),
                title: 'Help',
                onTap: () {},
              ),
              const Divider(),
              CustomListTile(
                leading: const Icon(Icons.logout_outlined),
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
