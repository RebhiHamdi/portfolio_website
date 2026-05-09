import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../components/cta_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppTheme.background,
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxWidth),
          child: Responsive.isDesktop(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _HeroTextContent(
                        onProjectsTap: onProjectsTap,
                        onContactTap: onContactTap,
                      ),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 4,
                      child: _HeroImageCard(isMobile: isMobile),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroImageCard(isMobile: isMobile),
                    const SizedBox(height: 40),
                    _HeroTextContent(
                      onProjectsTap: onProjectsTap,
                      onContactTap: onContactTap,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroTextContent extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _HeroTextContent({
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HeroBadge(label: 'Open to embedded product work'),
        const SizedBox(height: 28),
        Text(
          AppConstants.name,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 56,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppConstants.title,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppTheme.accent,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            'Building enduring embedded systems and connected product experiences. I bridge the gap between low-level hardware and user-facing software, focusing on disciplined execution and relentless field reliability.',
            style: GoogleFonts.inter(
              fontSize: 17,
              color: AppTheme.textSecondary,
              height: 1.75,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _HeroBullet(label: 'Architecting STM32 & nRF52 firmware for BLE and complex sensor integration'),
            SizedBox(height: 14),
            _HeroBullet(label: 'Developing full-stack ecosystems: Flutter mobile interfaces, NestJS backends, and automated workflows'),
            SizedBox(height: 14),
            _HeroBullet(label: 'Leading end-to-end product engineering—from bare-metal to cloud—for dependable deployment'),
          ],
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            CTAButton(
              label: 'View Projects',
              onTap: onProjectsTap,
              isPrimary: true,
            ),
            CTAButton(
              label: 'Talk to Me',
              onTap: onContactTap,
              isPrimary: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroBadge extends StatelessWidget {
  final String label;

  const _HeroBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.9),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppTheme.accent.withOpacity(0.25)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppTheme.accent,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _HeroBullet extends StatelessWidget {
  final String label;

  const _HeroBullet({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: AppTheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppTheme.textSecondary,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroImageCard extends StatelessWidget {
  final bool isMobile;

  const _HeroImageCard({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -28,
          right: -10,
          child: Container(
            width: isMobile ? 120 : 160,
            height: isMobile ? 120 : 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [AppTheme.accent.withOpacity(0.22), Colors.transparent],
                radius: 0.8,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceLight,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppTheme.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.background.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      'End-to-End System Design',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'lib/assets/images/profile_photo.jpeg',
                    fit: BoxFit.cover,
                    height: isMobile ? 320 : 380,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: isMobile ? 320 : 380,
                        color: AppTheme.primary.withOpacity(0.12),
                        child: Icon(
                          Icons.person,
                          size: isMobile ? 72 : 96,
                          color: AppTheme.accent,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'System focus',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.textSecondary,
                            letterSpacing: 0.6,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Embedded products',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'nRF52 • STM32 • Flutter • NestJS',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.primaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
