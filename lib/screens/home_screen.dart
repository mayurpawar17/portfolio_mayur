import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_mayur/widgets/about_section.dart';
import 'package:portfolio_mayur/widgets/education_section.dart';
import 'package:portfolio_mayur/widgets/experience_section.dart';
import 'package:portfolio_mayur/widgets/footer_section.dart';
import 'package:portfolio_mayur/widgets/hero_section.dart';
import 'package:portfolio_mayur/widgets/skill_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../core/helper_widgets.dart';
import '../widgets/project_scetion.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // We'll create a list of sections. Index matches the list below.
  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _positionsListener =
      ItemPositionsListener.create();

  final List<String> sections = [
    'Hero',
    'About',
    'Projects',
    'Skills',
    'Education',
    'Experience',
    'Footer',
  ];

  int _selectedIndex = 0;

  Widget topNav(BuildContext ctx, bool isDesktop) {
    if (!isDesktop) return const SizedBox();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(32),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  navIcon(0, FontAwesomeIcons.house),
                  navIcon(1, FontAwesomeIcons.circleInfo),
                  navIcon(2, FontAwesomeIcons.briefcase),
                  navIcon(3, FontAwesomeIcons.solidStar),
                  navIcon(4, FontAwesomeIcons.school),
                  navIcon(5, FontAwesomeIcons.suitcase),
                  // navIcon(6, FontAwesomeIcons.at),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Theme toggle
          IconButton(
            tooltip: 'Toggle Theme',
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDark ? Icons.wb_sunny : Icons.dark_mode),
          ),
        ],
      ),
    );
  }

  Widget bottomCenterNav(BuildContext ctx) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // card like pill
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    navIcon(0, FontAwesomeIcons.house),
                    navIcon(1, FontAwesomeIcons.circleInfo),
                    navIcon(2, FontAwesomeIcons.briefcase),
                    navIcon(3, FontAwesomeIcons.solidStar),
                    navIcon(4, FontAwesomeIcons.school),
                    navIcon(5, FontAwesomeIcons.suitcase),
                    // navIcon(6, FontAwesomeIcons.at),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navIcon(int index, IconData icon) {
    final active = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        scrollTo(index, _scrollController);
        setState(() => _selectedIndex = index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: active ? Colors.indigo : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 16,
          color: active ? Colors.white : Colors.grey[700],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine layout type
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1000;
    final isTablet = width >= 600 && width < 1000;

    return Scaffold(
      // top navigation for desktop inside AppBar area
      appBar:
          isDesktop
              ? PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: SafeArea(child: topNav(context, isDesktop)),
              )
              : null,
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: sections.length,
            itemScrollController: _scrollController,
            itemPositionsListener: _positionsListener,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Widget section;
              switch (index) {
                case 0:
                  // section = heroSection(context, isDesktop);
                  section = HeroSection(isDesktop: isDesktop);
                  break;
                case 1:
                  // section = aboutSection(context, isDesktop);
                  section = sectionWrapper(
                    child: AboutSection(isDesktop: isDesktop),
                  );
                  break;
                case 2:
                  section = sectionWrapper(
                    child: ProjectsSection(isDesktop: isDesktop),
                  );
                  // section = projectsSection(context, isDesktop);
                  break;
                case 3:
                  // section = skillsSection(context, isDesktop);
                  section = sectionWrapper(
                    child: SkillSection(isDesktop: isDesktop),
                  );
                  break;
                case 4:
                  // section = educationSection(context, isDesktop);
                  section = sectionWrapper(
                    child: EducationSection(isDesktop: isDesktop),
                  );
                  break;
                case 5:
                  // section = experienceSection(context, isDesktop);
                  section = sectionWrapper(
                    child: ExperienceSection(isDesktop: isDesktop),
                  );
                  break;
                case 6:
                default:
                  // section = footerSection(context, isDesktop);
                  section = FooterSection();
              }

              // Wrap sections with padding & fade animation
              return Container(
                width: double.infinity,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: section,
                ),
              );
            },
          ),

          // bottom center nav for mobile & tablet
          if (!isDesktop)
            Positioned(
              left: 0,
              right: 0,
              bottom: 12,
              child: bottomCenterNav(context),
            ),
        ],
      ),
      // floating action button (quick top)
      floatingActionButton:
          isDesktop
              ? FloatingActionButton(
                onPressed: () => scrollTo(0, _scrollController),
                child: const Icon(Icons.arrow_upward),
              )
              : null,
    );
  }
}
