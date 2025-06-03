import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String navItem;
  const NavItem(this.navItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(navItem, style: TextStyle(color: Colors.white)),
    );
  }
}
