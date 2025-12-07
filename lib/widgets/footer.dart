import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              // Name
              const Text(
                "Mayur Pawar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),

              // Small bio or tagline
              const Text(
                "Flutter Developer • Mobile App Specialist",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),

              const SizedBox(height: 20),

              // Social icons row
              Wrap(
                spacing: 20,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  footerButton(label: "GitHub", url: "https://github.com/"),
                  footerButton(label: "LinkedIn", url: "https://linkedin.com/"),
                  footerButton(
                    label: "Instagram",
                    url: "https://instagram.com/",
                  ),
                  footerButton(label: "Email", url: "mailto:mayur@example.com"),
                ],
              ),

              const SizedBox(height: 30),

              // Bottom text
              const Text(
                "© 2025 Mayur Pawar • All Rights Reserved",
                style: TextStyle(color: Colors.white38, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget footerButton({required String label, required String url}) {
    return InkWell(
      onTap: () {
        // for Flutter web URL launch
      },
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 15,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
