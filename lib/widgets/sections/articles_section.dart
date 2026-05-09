import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../../data/articles.dart'; // Points to your new data file
import '../components/section_title.dart';
import '../components/article_card.dart'; // We will update the card next!

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

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
                title: 'Technical Writing',
                subtitle: 'Articles on embedded systems, backend architecture, and engineering leadership',
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
        children: articles.map((article) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ArticleCard(article: article), // Swapped to ArticleCard
          );
        }).toList(),
      );
    }

    final rows = <Widget>[];
    for (var i = 0; i < articles.length; i += crossAxisCount) {
      final rowArticles = articles.skip(i).take(crossAxisCount).toList();
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowArticles.map((article) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: rowArticles.last == article ? 0 : 24,
                  ),
                  child: ArticleCard(article: article),
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