class AppConstants {
  AppConstants._();

  // Personal info
  static const String name = 'Hamdi Rebhi';
  static const String title = 'Lead Embedded Software Engineer';
  static const String tagline =
      'Building reliable systems at the intersection of hardware and software. '
      'Specializing in embedded firmware, BLE, and sensor integration.';

  // Contact
  static const String email = 'hamdi.rebhi.eng@gmail.com';
  static const String githubUrl = 'https://github.com/RebhiHamdi';
  static const String linkedinUrl = 'https://www.linkedin.com/in/hamdi-rebhi-a7131a169/';

  // Layout
  static const double maxWidth = 1200;
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1200;
  static const double sectionPadding = 80;
  static const double mobileSectionPadding = 48;

  // Animation
  static const Duration animationDuration = Duration(milliseconds: 600);

  // Navigation sections (must match section keys)
  static const List<String> navSections = [
    'about',
    'skills',
    'projects',
    'videos',
    'experience',
    'contact',
  ];

  static const Map<String, String> navLabels = {
    'about': 'About',
    'skills': 'Skills',
    'projects': 'Projects',
    'videos': 'Demos',
    'experience': 'Experience',
    'contact': 'Contact',
  };
}