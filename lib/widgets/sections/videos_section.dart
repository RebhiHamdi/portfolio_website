import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/responsive.dart';
import '../../data/videos.dart';
import '../components/section_title.dart';
import '../components/video_card.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({super.key});

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
                title: 'Demo Videos',
                subtitle: 'Watch walkthroughs and live demos of my projects',
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
        children: videos.map((video) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: VideoCard(video: video),
          );
        }).toList(),
      );
    }

    final rows = <Widget>[];
    for (var i = 0; i < videos.length; i += crossAxisCount) {
      final rowVideos = videos.skip(i).take(crossAxisCount).toList();
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowVideos.map((video) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: rowVideos.last == video ? 0 : 24,
                  ),
                  child: VideoCard(video: video),
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