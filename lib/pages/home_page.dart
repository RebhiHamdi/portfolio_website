
import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/components/nav_bar.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/videos_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/footer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    'hero': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'videos': GlobalKey(),
    'experience': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _navigateToSection(String section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: [
          // Fixed navigation bar
          NavBar(onNavigate: _navigateToSection),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    key: _sectionKeys['hero'],
                    child: HeroSection(
                      onProjectsTap: () => _navigateToSection('projects'),
                      onContactTap: () => _navigateToSection('contact'),
                    ),
                  ),
                  Container(key: _sectionKeys['about'], child: const AboutSection()),
                  Container(key: _sectionKeys['skills'], child: const SkillsSection()),
                  Container(key: _sectionKeys['projects'], child: const ProjectsSection()),
                  Container(key: _sectionKeys['videos'], child: const VideosSection()),
                  Container(key: _sectionKeys['experience'], child: const ExperienceSection()),
                  Container(key: _sectionKeys['contact'], child: const ContactSection()),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}