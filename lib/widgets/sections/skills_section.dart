import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../../data/skills.dart';
import '../components/section_title.dart';
import '../components/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Group skills by category
    final categories = <String, List<dynamic>>{};
    for (final skill in skills) {
      categories.putIfAbsent(skill.category, () => []).add(skill);
    }

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
                title: 'Skills',
                subtitle: 'Technologies and tools I work with',
              ),
              const SizedBox(height: 40),
              ...categories.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.accent,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: entry.value.map((skill) {
                          return SkillChip(skill: skill as dynamic);
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}