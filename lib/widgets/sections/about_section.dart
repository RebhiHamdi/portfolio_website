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
                subtitle: 'Engineering disciplined systems from bare-metal to the cloud',
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
          'I connect low-level firmware, wireless radios, and scalable applications to build devices that behave predictably in the real world.',
          style: GoogleFonts.inter(
            fontSize: 18,
            color: AppTheme.textSecondary,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'My focus is end-to-end product engineering. From architecting low-power nRF52 and STM32 firmware to deploying scalable NestJS and MongoDB backends , I ensure the physical hardware is perfectly integrated with the Flutter user experience.',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: AppTheme.textMuted,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I build systems that endure, not just prototypes. Applying disciplined execution to complex architectures, I prioritize clear C/C++ firmware design, stable BLE wireless behavior, and mentoring engineering teams to deliver field-ready products.',
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
          _StatItem(value: 'Academic Foundation', label: 'Engineering degree in electronics (Embedded systems) from the Faculty of Sciences, Tunis'),
          Divider(color: AppTheme.border, height: 32),
          _StatItem(value: 'End-to-End Delivery', label: 'Bridging the gap between hardware sensors and full-stack (Flutter, NestJS, n8n) deployment'),
          Divider(color: AppTheme.border, height: 32),
          _StatItem(value: 'Technical Leadership', label: 'Guiding hardware integration and mentoring PFE and summer intern engineers through complex product lifecycles'),
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
