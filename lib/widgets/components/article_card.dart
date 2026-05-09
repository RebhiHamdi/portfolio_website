import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/theme.dart';
import '../../data/articles.dart';

class ArticleCard extends StatefulWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(widget.article.link)),
        onHover: (value) => setState(() => _isHovered = value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section (No more Play Button!)
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceLight,
                    image: DecorationImage(
                      image: widget.article.imageUrl.startsWith('http')
                          ? NetworkImage(widget.article.imageUrl) as ImageProvider
                          : AssetImage(widget.article.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Optional dark overlay on hover for interactivity
                if (_isHovered)
                  Container(
                    height: 200,
                    color: Colors.black.withValues(alpha: 0.1),
                  ),
              ],
            ),
            // Text Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article.title,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.article.description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Date
                      Text(
                        widget.article.date,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      // Medium Link
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book, // Changed icon to a book
                            size: 16,
                            color: _isHovered ? AppTheme.primaryLight : AppTheme.textSecondary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Read on Medium',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _isHovered ? AppTheme.primaryLight : AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}