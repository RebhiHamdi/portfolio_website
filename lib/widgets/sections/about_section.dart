import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../components/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: 'About',
                subtitle: 'Connecting firmware, devices and software',
              ),
              const SizedBox(height: 40),
              isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBio(),
        const SizedBox(height: 32),
        _buildStats(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildBio()),
        const SizedBox(width: 48),
        Expanded(flex: 2, child: _buildStats()),
      ],
    );
  }

  Widget _buildBio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I connect firmware, radios and apps to build devices that behave predictably in the real world.',
          style: GoogleFonts.inter(
            fontSize: 18,
            color: AppTheme.textSecondary,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'My focus is embedded product engineering: STM32 and nRF52 firmware, BLE and sensor integration, power-efficient systems, and Flutter interfaces that make hardware usable.',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: AppTheme.textMuted,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I build systems for reliability, not prototypes. That means clear firmware design, stable wireless behavior, and user-facing software that supports the product end to end.',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: AppTheme.textMuted,
            height: 1.8,
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        children: const [
          _StatItem(value: '3+', label: 'Years embedded engineering'),
          Divider(color: AppTheme.border, height: 32),
          _StatItem(value: '20+', label: 'Firmware and app integrations'),
          Divider(color: AppTheme.border, height: 32),
          _StatItem(value: '5+', label: 'BLE product deliveries'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }
}
