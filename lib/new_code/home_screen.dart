import 'package:flutter/material.dart';
import 'package:saim_portfolio/new_code/app_constants.dart';
import 'package:saim_portfolio/new_code/contact_section.dart';
import 'package:saim_portfolio/new_code/experience_section.dart';
import 'package:saim_portfolio/new_code/footer_section.dart';
import 'package:saim_portfolio/new_code/hero_section.dart';
import 'package:saim_portfolio/new_code/navbar.dart';
import 'package:saim_portfolio/new_code/projects_section.dart';
import 'package:saim_portfolio/new_code/services_section.dart';
import 'package:saim_portfolio/new_code/skills_section.dart';
import 'package:saim_portfolio/new_code/stats_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollCtrl = ScrollController();

  // One key per nav item (must match PortfolioData.navItems order)
  final _heroKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _expKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final List<GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _sectionKeys = [
      _heroKey,
      _skillsKey,
      _expKey,
      _projectsKey,
      _servicesKey,
      _contactKey,
    ];
  }

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollCtrl,
            child: Column(
              children: [
                // Spacer for navbar height
                const SizedBox(height: 64),

                // 1 - Hero
                Container(
                  key: _heroKey,
                  child: HeroSection(
                    onViewWork: () => _scrollToSection(_projectsKey),
                    onContact: () => _scrollToSection(_contactKey),
                  ),
                ),

                // Stats bar
                const StatsBar(),

                // 2 - Skills
                Container(key: _skillsKey, child: const SkillsSection()),

                // 3 - Experience
                Container(key: _expKey, child: const ExperienceSection()),

                // 4 - Projects
                Container(key: _projectsKey, child: const ProjectsSection()),

                // 5 - Services
                Container(key: _servicesKey, child: const ServicesSection()),

                // 6 - Contact
                Container(key: _contactKey, child: const ContactSection()),

                // Footer
                const FooterSection(),
              ],
            ),
          ),

          // Fixed Navbar on top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: _scrollCtrl,
              sectionKeys: _sectionKeys,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }
}
