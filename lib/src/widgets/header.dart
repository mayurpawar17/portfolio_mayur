import 'package:flutter/material.dart';
import 'package:portfolio_mayur/src/widgets/navItem.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.deepPurple,
      ),
      height: MediaQuery.of(context).size.height * 0.1,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mayur"),
            Row(
              children: [
                NavItem("Home"),
                NavItem("Project"),
                NavItem("Skills"),
                NavItem("About"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
