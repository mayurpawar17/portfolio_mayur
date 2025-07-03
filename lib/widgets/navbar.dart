// Updated modern, responsive NavBar with center menu and social icons
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const _MobileNavBar(),
      tablet: (_) => const _MobileNavBar(),
      desktop: (_) => const _DesktopNavBar(),
    );
  }
}

class _DesktopNavBar extends StatelessWidget {
  const _DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/jquery.png',
            height: 40,
          ),

          // Centered Navigation Menu
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                NavBarItem(label: 'Home'),
                NavBarItem(label: 'Projects'),
                NavBarItem(label: 'Skills'),
                NavBarItem(label: 'About'),
              ],
            ),
          ),

          // Social icons and theme toggle (right side)
          Row(
            children: [
              IconButton(
                icon: Image.asset('assets/jquery.png', height: 24),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('assets/jquery.png', height: 24),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              Row(
                children: const [
                  Icon(Icons.wb_sunny_outlined, size: 20),
                  SizedBox(width: 4),
                  Text('Light')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MobileNavBar extends StatefulWidget {
  const _MobileNavBar({super.key});

  @override
  State<_MobileNavBar> createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<_MobileNavBar> {
  bool menuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/jquery.png', height: 40),
              IconButton(
                icon: Icon(menuOpen ? Icons.close : Icons.menu),
                onPressed: () => setState(() => menuOpen = !menuOpen),
              )
            ],
          ),
        ),
        if (menuOpen)
          Column(
            children: [
              const NavBarItem(label: 'Home'),
              const NavBarItem(label: 'Projects'),
              const NavBarItem(label: 'Skills'),
              const NavBarItem(label: 'About'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/jquery.png', height: 24),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('assets/jquery.png', height: 24),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
      ],
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String label;
  const NavBarItem({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
