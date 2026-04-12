import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
      decoration: const BoxDecoration(
        color: AppTheme.background,
        border: Border(
          top: BorderSide(color: AppTheme.border),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxWidth),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      _SocialIcon(
                        icon: Icons.code,
                        onTap: () => launchUrl(Uri.parse(AppConstants.githubUrl)),
                        tooltip: 'GitHub',
                      ),
                      const SizedBox(width: 16),
                      _SocialIcon(
                        icon: Icons.business,
                        onTap: () => launchUrl(Uri.parse(AppConstants.linkedinUrl)),
                        tooltip: 'LinkedIn',
                      ),
                      const SizedBox(width: 16),
                      _SocialIcon(
                        icon: Icons.email_outlined,
                        onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.email}')),
                        tooltip: 'Email',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                '© ${DateTime.now().year} Hamdi Rebhi. Built with Flutter.',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;

  const _SocialIcon({
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _isHovered ? AppTheme.surfaceLight : AppTheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.border),
            ),
            child: Icon(
              widget.icon,
              size: 18,
              color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}