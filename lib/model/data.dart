import 'package:flutter/material.dart';

class Video {
  final String thumbnailUrl;
  final String channelArt;
  final String title;
  final String channelName;
  final String viewCount;
  final String upload;
  final String duration;

  Video({
    required this.thumbnailUrl,
    required this.channelArt,
    required this.title,
    required this.channelName,
    required this.viewCount,
    required this.upload,
    required this.duration,
  });


 static  final List<Video> _videos = [
     Video(
      thumbnailUrl: 'images/youtube_task/iyappan.jpeg',
      channelArt: 'images/youtube_task/sony_music_large_logo.jpeg',
      title:
      'swamiye ayyappo ayyappo swamiye...sabarimala padayatra song malayalam',
      channelName: 'Sony Music India -',
      viewCount: '22M views -',
      upload: '8 years ago',
      duration: '39:08',
    ),
    Video(
        thumbnailUrl: 'images/youtube_task/android_youtube_banner.png',
        channelArt: 'images/youtube_task/android_youtube_logo.jpeg',
        title: 'Whats new in Android Studio - Giraffe',
        channelName: 'Android Developers -',
        viewCount: '11M views -',
        upload: '2 days ago',
        duration: '6:40'),
     Video(
        thumbnailUrl: 'images/youtube_task/dart_flutter_banner.jpeg',
        channelArt: 'images/youtube_task/flutter_logo.jpeg',
        title: 'Why Flutter uses Dart',
        channelName: 'Flutter -',
        viewCount: '207K views -',
        upload: '3 years ago',
        duration: '1:37'),
     Video(
        thumbnailUrl: 'images/youtube_task/flutter_banner.jpeg',
        channelArt: 'images/youtube_task/flutter_logo.jpeg',
        title: 'Firestore (Package of the Week)',
        channelName: 'Flutter -',
        viewCount: '18k views -',
        upload: '2 weeks ago',
        duration: '2:21'),
    Video(
        thumbnailUrl: 'images/youtube_task/sk_banner.jpeg',
        channelArt: 'images/youtube_task/saregama_logo.jpeg',
        title:
        'Scene Ah Scene Ah - Video song | Maaveeran | Sivakarthikeyan | Anirudh Ravichander | Bharath Sankar',
        channelName: 'Saregama Tamil -',
        viewCount: '1M views -',
        upload: '3 hours ago',
        duration: '5:35'),
  ];

    static List<Video> get videos => _videos;
}

