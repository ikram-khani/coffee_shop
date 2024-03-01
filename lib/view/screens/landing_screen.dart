import 'package:coffee_shop/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            fit: BoxFit.cover,
            width: double.infinity,
            image: AssetImage('assets/images/coffe_background.png'),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'COFFEE SHOP',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Enjoy the drink coffee.',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 90),
            ),
            child: const Text(
              'SHOP NOW',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
