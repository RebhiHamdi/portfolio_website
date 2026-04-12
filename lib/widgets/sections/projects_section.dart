import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../../data/projects.dart';
import '../components/section_title.dart';
import '../components/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Responsive.gridCrossAxisCount(context);

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
                title: 'Projects',
                subtitle: 'Selected work that demonstrates what I build',
              ),
              const SizedBox(height: 40),
              _buildGrid(context, crossAxisCount),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, int crossAxisCount) {
    if (crossAxisCount == 1) {
      return Column(
        children: projects.map((project) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ProjectCard(project: project),
          );
        }).toList(),
      );
    }

    final rows = <Widget>[];
    for (var i = 0; i < projects.length; i += crossAxisCount) {
      final rowProjects = projects.skip(i).take(crossAxisCount).toList();
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowProjects.map((project) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: rowProjects.last == project ? 0 : 24,
                  ),
                  child: ProjectCard(project: project),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}