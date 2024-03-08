import 'package:coffee_shop/view/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: deviceHeight / 10.5),
        width: 150,
        height: 170,
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
            children: const [
              SizedBox(
                height: 10,
              ),
              CustomListTile(
                leading: Icon(Icons.person),
                title: 'Profile',
              ),
              Divider(),
              CustomListTile(
                leading: Icon(Icons.settings_outlined),
                title: 'Settings',
              ),
              Divider(),
              CustomListTile(
                leading: Icon(Icons.help_outline),
                title: 'Help',
              ),
              Divider(),
              CustomListTile(
                leading: Icon(Icons.logout_outlined),
                title: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
