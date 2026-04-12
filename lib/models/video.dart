class Video {
  final String id;
  final String title;
  final String description;
  final String youtubeId;

  const Video({
    required this.id,
    required this.title,
    required this.description,
    required this.youtubeId,
  });

  String get thumbnailUrl =>
      'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';

  String get youtubeUrl =>
      'https://www.youtube.com/watch?v=$youtubeId';
}