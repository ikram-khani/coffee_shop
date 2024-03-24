import 'package:coffee_shop/view/widgets/info_action_tile.dart';
import 'package:coffee_shop/view/widgets/info_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      radius: 45,
                      backgroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/thumbnails/024/183/525/small/avatar-of-a-man-portrait-of-a-young-guy-illustration-of-male-character-in-modern-color-style-vector.jpg'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Iqbal Anwar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      '+9230896873432',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 25,
                  right: 25,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(15, 10),
                    topRight: Radius.elliptical(15, 10),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InfoTile(
                        titleText: 'Email',
                        valueText: 'zahoorkhani@gmail.com',
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      const InfoTile(
                        titleText: 'Date of birth',
                        valueText: '12/04/2003',
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      const InfoTile(
                        titleText: 'Gender',
                        valueText: 'Male',
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      const InfoTile(
                        titleText: 'Phone',
                        valueText: '+9230108182938',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InfoActionTile(
                        icon: Icons.lock_outline,
                        title: 'Change Password',
                        iconColor:
                            Theme.of(context).primaryColor.withOpacity(0.6),
                        iconBackgroundColor: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InfoActionTile(
                        icon: FontAwesomeIcons.clipboardList,
                        title: 'My Orders',
                        iconColor: Colors.green,
                        iconBackgroundColor: Colors.green.withOpacity(0.3),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.1),
                        height: 5,
                      ),
                      InfoActionTile(
                        icon: Icons.live_help_outlined,
                        title: 'Help',
                        iconColor: Colors.purple,
                        iconBackgroundColor: Colors.purple.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
