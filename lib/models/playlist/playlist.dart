import 'package:flutter/material.dart';

class Playlist {
  final Image image;
  final String name;
  final Color playlistColor;
  final int newVideosCount;
  final int watchedVieosCount;
  final int allVideosCount;

  Playlist({
    required this.image,
    required this.name,
    required this.playlistColor,
    required this.newVideosCount,
    required this.watchedVieosCount,
    required this.allVideosCount,
  });
}
