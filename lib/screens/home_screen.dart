import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widgets/project_card2.dart';

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

  void scrollTo(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

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
        scrollTo(index);
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

  Widget heroSection(BuildContext ctx, bool isDesktop) {
    if (isDesktop) {
      // ---------- DESKTOP UI ----------
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 110 : 20,
          vertical: 40,
        ),

        child: Row(
          children: [
            // left text
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mayur Pawar',
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Full Stack Developer & AI Researcher',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.github),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.linkedin),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.envelope),
                      ),
                    ],
                  ),
                ],
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.03),
            ),

            // avatar
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child:
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: const AssetImage('assets/profile.png'),
                    ).animate().scaleXY(begin: 0.9, duration: 500.ms).fadeIn(),
              ),
            ),
          ],
        ),
      );
    }

    // ---------- MOBILE + TABLET UI (Column layout) ----------
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: const AssetImage('assets/profile.png'),
          ).animate().scaleXY(begin: 0.9, duration: 500.ms).fadeIn(),

          const SizedBox(height: 20),

          Text(
            'Mayur Pawar',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 8),

          Text(
            'Full Stack Developer & AI Researcher',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.github),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.linkedin),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.envelope),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget aboutSection(BuildContext ctx, bool isDesktop) {
    final text = '''
Hi, I'm Mayur 👋, founder of Open-Sora and Video-Ocean. I'm working on AI-powered video generation and SaaS products that bridge research and real-world creativity.
''';
    return sectionWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 120 : 20,
          vertical: 40,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: isDesktop ? 2 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('About'),
                  const SizedBox(height: 12),
                  Text(text, style: const TextStyle(fontSize: 15, height: 1.6)),
                ],
              ),
            ),
            if (isDesktop) const SizedBox(width: 40),
            // if (isDesktop)
            //   Expanded(
            //     flex: 1,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         sectionTitle('Research Interests'),
            //         const SizedBox(height: 12),
            //         Text('Video Generation, Efficient ML, DL Optimizations'),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget projectsSection(BuildContext ctx, bool isDesktop) {
    final List<Map<String, String>> sample = [
      {
        'title': 'Video-Ocean Video Agent',
        'date': 'Jun. 2025 - Present',
        'image': 'assets/bmi_bg.png',
      },
      {
        'title': 'Open-Sora',
        'date': 'Mar. 2024 - Mar. 2025',
        'image': 'assets/bmi_bg.png',
      },
      {
        'title': 'Video-Ocean',
        'date': 'Apr. 2025 - Present',
        'image': 'assets/bmi_bg.png',
      },

      {
        'title': 'Video-Ocean',
        'date': 'Apr. 2025 - Present',
        'image': 'assets/bmi_bg.png',
      },
    ];

    return sectionWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 120 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('Check out my latest work'),
            const SizedBox(height: 18),
            // Responsive grid
            LayoutBuilder(
              builder: (c, cons) {
                final crossAxis = isDesktop ? 3 : (cons.maxWidth > 600 ? 2 : 1);
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sample.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxis,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.3,
                  ),
                  itemBuilder: (ctx, i) {
                    final item = sample[i];
                    // return ProjectCard(
                    //   title: item['title']!,
                    //   date: item['date']!,
                    //   image: item['image']!,
                    // ).animate().fadeIn(
                    //   duration: 500.ms,
                    //   delay: Duration(milliseconds: 120 * i),
                    // );

                    return ProjectCard2(
                      title: item['title']!,
                      date: item['date']!,
                      image: item['image']!,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                icon: const Icon(Icons.expand_more),
                label: const Text('Show All'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget skillsSection(BuildContext ctx, bool isDesktop) {
    final skills = [
      'Python',
      'PyTorch',
      'TensorFlow',
      'ColossalAI',
      'vLLM',
      'LangGraph',
      'OpenAI API',
      'FastAPI',
      'PostgreSQL',
      'TypeScript',
      'React',
      'Next.js',
      'Docker',
      'Terraform',
    ];
    return sectionWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 120 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('Skills'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  skills
                      .map(
                        (s) => Chip(
                          backgroundColor: Theme.of(context).cardColor,
                          label: Text(s),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget educationSection(BuildContext ctx, bool isDesktop) {
    final items = [
      {
        'title': 'National University of Singapore',
        'subtitle': 'Ph.D. in Computer Science',
        'years': '2021 - 2025',
        'logo': 'assets/bmi_bg.png',
      },
      {
        'title': 'Nanjing University',
        'subtitle': 'Bachelor\'s Degree of Computer Science',
        'years': '2017 - 2021',
        'logo': 'assets/bmi_bg.png',
      },
      {
        'title': 'Jiangsu Xishan Senior High School',
        'subtitle': 'High School Diploma',
        'years': '2014 - 2017',
        'logo': 'assets/bmi_bg.png',
      },
    ];

    return sectionWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 120 : 20,
          vertical: 40,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('Education'),
            const SizedBox(height: 12),
            Column(
              children:
                  items.map((it) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(it['logo']!),
                      ),
                      title: Text(
                        it['title']!,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(it['subtitle']!),
                      trailing: Text(
                        it['years']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ).animate().fadeIn();
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget experienceSection(BuildContext ctx, bool isDesktop) {
    final items = [
      {
        'title': 'HPC-AI Tech',
        'role': 'Tech Lead',
        'date': 'Dec. 2024 - Present',
      },
      {
        'title': 'Bytedance',
        'role': 'Research Intern',
        'date': 'Jun. 2021 - Jun. 2022',
      },
      {
        'title': 'UC Berkeley',
        'role': 'Research Intern',
        'date': 'Apr. 2020 - May. 2021',
      },
    ];

    return sectionWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 120 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('Internship & Work Experience'),
            const SizedBox(height: 12),
            Column(
              children:
                  items.map((it) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage('assets/profile.png'),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  it['title']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  it['role']!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            it['date']!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget footerSection(BuildContext ctx, bool isDesktop) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2025 Zangwei Zheng • All rights reserved',
                style: TextStyle(color: Colors.grey[500]),
              ),
              Row(
                children: [
                  Text(
                    'Build with ',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const Icon(FontAwesomeIcons.github, size: 14),
                  const SizedBox(width: 8),
                  Text(
                    'zhengzangw/nextjs-portfolio...',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // small helpers
  Widget sectionTitle(String t) {
    return Text(
      t,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
    );
  }

  Widget sectionWrapper({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: child,
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
                  section = heroSection(context, isDesktop);
                  break;
                case 1:
                  section = aboutSection(context, isDesktop);
                  break;
                case 2:
                  section = projectsSection(context, isDesktop);
                  break;
                case 3:
                  section = skillsSection(context, isDesktop);
                  break;
                case 4:
                  section = educationSection(context, isDesktop);
                  break;
                case 5:
                  section = experienceSection(context, isDesktop);
                  break;
                case 6:
                default:
                  section = footerSection(context, isDesktop);
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
                onPressed: () => scrollTo(0),
                child: const Icon(Icons.arrow_upward),
              )
              : null,
    );
  }
}
