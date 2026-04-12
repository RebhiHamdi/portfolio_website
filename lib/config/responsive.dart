import 'package:flutter/material.dart';
import 'constants.dart';

class Responsive {
  Responsive._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.mobileBreakpoint &&
      MediaQuery.of(context).size.width < AppConstants.tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;

  static int gridCrossAxisCount(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  static double contentWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > AppConstants.maxWidth
        ? AppConstants.maxWidth
        : screenWidth;
  }

  static EdgeInsets sectionPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: isMobile(context) ? 20 : 40,
      vertical: isMobile(context)
          ? AppConstants.mobileSectionPadding
          : AppConstants.sectionPadding,
    );
  }
}