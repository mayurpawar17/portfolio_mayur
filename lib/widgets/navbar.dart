import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const NavBar({Key? key, required this.onToggleTheme, required this.isDark})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// ------------------------------------------
          /// LOGO / NAME
          /// ------------------------------------------
          Text(
            "Mayur.",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),

          /// ------------------------------------------
          /// NAV ITEMS + THEME SWITCH
          /// ------------------------------------------
          Row(
            children: [
              _navItem("Home"),
              const SizedBox(width: 20),
              _navItem("About"),
              const SizedBox(width: 20),
              _navItem("Work"),
              const SizedBox(width: 20),
              _navItem("Contact"),
              const SizedBox(width: 30),

              /// --------------------------------------
              /// DARK/LIGHT MODE SWITCH
              /// --------------------------------------
              GestureDetector(
                onTap: onToggleTheme,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:
                        isDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.05),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Simple nav item widget
  Widget _navItem(String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
