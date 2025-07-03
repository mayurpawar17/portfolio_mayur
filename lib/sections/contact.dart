import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'your.email@example.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Text("Let's Connect", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _launchEmail,
            icon: const Icon(Icons.email),
            label: const Text("Email Me"),
          ),
        ],
      ),
    );
  }
}