import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/faq_item.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  final String whatsappNumber = '+923089685902';
  final String defaultMessage = 'Hello Ik Coffee Craze! I need some help.';

  void _launchWhatsApp() async {
    String url =
        'https://wa.me/$whatsappNumber?text=${Uri.encodeFull(defaultMessage)}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch Whatsapp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help & Support',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purpose and Overview:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const Text(
              'Ik Coffee Craze is your go-to app for discovering and ordering your favorite coffee drinks. Explore our menu, customize your orders, and enjoy the convenience of mobile ordering!',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Getting Started:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const Text(
              '1. Download and install the Ik Coffee Craze app.\n2. Sign up or log in to your account.\n3. Browse the menu, customize your coffee, and add items to your cart.\n4. Proceed to checkout, select a payment method, and place your order.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'FAQs:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const FaqItem(
              question: 'How do I place an order?',
              answer:
                  'To place an order, browse our menu, select your desired coffee drinks, customize them as per your preference, and add them to your cart. Proceed to checkout, choose a payment method, and confirm your order.',
            ),
            const FaqItem(
              question: 'Can I customize my coffee orders?',
              answer:
                  'Yes, you can customize your coffee orders by choosing the type of coffee, size, milk preference, and additional toppings or flavors as available.',
            ),
            const FaqItem(
              question: 'How do I track my order?',
              answer:
                  'Once you place an order, you can track its status in the app. You will receive notifications regarding the order confirmation, preparation, and estimated delivery or pickup time.',
            ),
            const FaqItem(
              question: 'What payment methods are accepted?',
              answer:
                  'We accept various payment methods, including credit/debit cards, mobile wallets, and cash on delivery, as available in your location.',
            ),
            const SizedBox(height: 32.0),
            ElevatedButton.icon(
              onPressed: _launchWhatsApp,
              icon: Image.asset(
                'assets/whatsapp_icon.png', // Replace with your WhatsApp icon asset
                width: 24.0,
                height: 24.0,
              ),
              label: const Text('Contact Support on WhatsApp'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            // Add more FAQs as needed
          ],
        ),
      ),
    );
  }
}
