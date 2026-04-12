import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../../data/experience.dart';
import '../components/section_title.dart';
import '../components/experience_timeline.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: 'Experience',
                subtitle: 'Where I\'ve worked and what I\'ve built',
              ),
              const SizedBox(height: 40),
              ExperienceTimeline(experiences: experiences),
            ],
          ),
        ),
      ),
    );
  }
}