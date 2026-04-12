import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';

class NavBar extends StatelessWidget {
  final void Function(String section) onNavigate;

  const NavBar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 32,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.95),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppConstants.maxWidth),
        child: Row(
          children: [
            if (isMobile)
              _buildMobileMenu(context)
            else
              Expanded(child: _buildDesktopLinks(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLinks(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: AppConstants.navSections.map((section) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _NavLink(
            label: AppConstants.navLabels[section]!,
            onTap: () => onNavigate(section),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
      onPressed: () => _showMobileMenu(context),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: AppConstants.navSections.map((section) {
                return ListTile(
                  title: Text(
                    AppConstants.navLabels[section]!,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onNavigate(section);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}