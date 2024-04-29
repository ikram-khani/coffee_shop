import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/faq_item.dart';

class HelpScreen extends StatelessWidget {
  final AppLocalizations appLocalizations;
  const HelpScreen({required this.appLocalizations, super.key});

  final String whatsappNumber = '+923089685902';

  void _launchWhatsApp() async {
    String url =
        'https://wa.me/$whatsappNumber?text=${Uri.encodeFull(appLocalizations.whatsapp_default_message)}';
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
        title: Text(
          appLocalizations.help_title_text,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalizations.purpose_overview_title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              appLocalizations.purpose_and_overview_discription,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              appLocalizations.getting_started_title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              appLocalizations.getting_started_steps,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              appLocalizations.faq_title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            FaqItem(
              question: appLocalizations.faq_q1,
              answer: appLocalizations.faq_answer1,
            ),
            FaqItem(
              question: appLocalizations.faq_q2,
              answer: appLocalizations.faq_answer2,
            ),
            FaqItem(
              question: appLocalizations.faq_q3,
              answer: appLocalizations.faq_answer3,
            ),
            FaqItem(
              question: appLocalizations.faq_q4,
              answer: appLocalizations.faq_answer4,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton.icon(
              onPressed: _launchWhatsApp,
              icon: Image.asset(
                'assets/whatsapp_icon.png', // Replace with your WhatsApp icon asset
                width: 24.0,
                height: 24.0,
              ),
              label: Text(appLocalizations.contact_title_text),
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
