import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../components/section_title.dart';
import '../components/cta_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.sectionPadding(context),
      color: AppTheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: 'Get in Touch',
                subtitle:
                    'Have a project in mind or want to discuss embedded systems? I\'d love to hear from you.',
              ),
              const SizedBox(height: 40),
              _buildContactContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMessage(),
          const SizedBox(height: 32),
          _buildContactLinks(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildMessage()),
        const SizedBox(width: 48),
        Expanded(flex: 2, child: _buildContactLinks()),
      ],
    );
  }

  Widget _buildMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Whether it\'s a BLE device that needs reliable firmware, a sensor system that '
          'demands precision, or a Flutter app to complete the picture — I\'m interested.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppTheme.textSecondary,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 24),
        CTAButton(
          label: 'Send me an email',
          onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.email}')),
        ),
      ],
    );
  }

  Widget _buildContactLinks() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ContactLink(
            icon: Icons.email_outlined,
            label: AppConstants.email,
            onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.email}')),
          ),
          const SizedBox(height: 16),
          _ContactLink(
            icon: Icons.code,
            label: 'GitHub',
            onTap: () => launchUrl(Uri.parse(AppConstants.githubUrl)),
          ),
          const SizedBox(height: 16),
          _ContactLink(
            icon: Icons.business,
            label: 'LinkedIn',
            onTap: () => launchUrl(Uri.parse(AppConstants.linkedinUrl)),
          ),
        ],
      ),
    );
  }
}

class _ContactLink extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 20,
              color: _isHovered ? AppTheme.primary : AppTheme.textMuted,
            ),
            const SizedBox(width: 12),
            Text(
              widget.label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
                decoration: _isHovered ? TextDecoration.underline : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}