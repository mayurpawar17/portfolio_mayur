import 'package:flutter/material.dart';
import 'package:portfolio_mayur/widgets/about_section.dart';
import 'package:portfolio_mayur/widgets/footer.dart';
import 'package:portfolio_mayur/widgets/hero_section.dart';
import 'package:portfolio_mayur/widgets/navbar.dart';
import 'package:portfolio_mayur/widgets/theme.dart';
import 'package:portfolio_mayur/widgets/work_section.dart';

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({Key? key}) : super(key: key);

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  bool _isDark = true;

  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mayur Pawar — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBar(onToggleTheme: _toggleTheme, isDark: _isDark),

                /// -------------------- HERO SECTION --------------------
                HeroSection(
                  name: 'Mayur Pawar',
                  role: 'Flutter Developer',
                  bio:
                      "I'm a Mobile Application developer with 6+months of experience; I develop software using extraordinary abilities, strategy, and design to meet any obstacle.",
                ),

                /// -------------------- ABOUT SECTION --------------------
                AboutSection(
                  //   bio:
                  //       "I have worked on a wide range of projects, from simple apps to complex enterprise-level solutions. I am constantly amazed by the power and flexibility of Flutter, and I believe that it is the future of mobile app development.",
                ),

                /// -------------------- WORK / PROJECTS SECTION --------------------
                WorkSection(),

                /// -------------------- FOOTER --------------------
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
