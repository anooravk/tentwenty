import 'package:flutter/material.dart';

import '../../res/colors/app_color.dart';
import '../widgets/player_widget.dart';
import '../widgets/text_widget.dart';

class MovieVideosScreen extends StatelessWidget {
  const MovieVideosScreen({super.key, this.thumbnailUrl, this.videoUrl});

  final thumbnailUrl;
  final videoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Video PLayer', size: 16, weight: FontWeight.bold, color: AppColor.blackColor, align: TextAlign.center),
      ),
      body: PlayerWidget(
        videoUrl: videoUrl,
        thumbnailUrl: thumbnailUrl,
      ),
    );
  }
}
