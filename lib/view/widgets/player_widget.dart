import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tentwenty/view/widgets/text_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../res/colors/app_color.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key, this.videoUrl, this.thumbnailUrl});

  final videoUrl;
  final thumbnailUrl;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> with WidgetsBindingObserver {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    videoPlayerController = VideoPlayerController.network(widget.videoUrl!);
    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((value) {
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
    });

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.duration != null && videoPlayerController.value.duration.inMilliseconds > 0) {
        setState(() {
          _progress = videoPlayerController.value.position.inMilliseconds / videoPlayerController.value.duration.inMilliseconds;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    _progress = 0.0;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  bool _isPlaying = true;

  void _togglePlayPause() {
    if (_isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  var t;
  double _progress = 0.0;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _isPlaying = false;
      videoPlayerController.pause();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
        ),
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Center(
                    child: VisibilityDetector(
                      key: ObjectKey(videoPlayerController),
                      onVisibilityChanged: (visibility) {
                        if (visibility.visibleFraction == 0 && mounted) {
                          videoPlayerController.pause();
                        }
                      },
                      child: GestureDetector(
                        onTap: () async {
                          _togglePlayPause();
                          setState(() {
                            t?.cancel();
                            t = Timer(
                              const Duration(seconds: 1),
                              () => setState(() => t = null),
                            );
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.height,
                          height: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: videoPlayerController.value.size.height,
                              height: videoPlayerController.value.size.width,
                              child: VideoPlayer(videoPlayerController),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 2.3,
                    right: 20,
                    left: 20,
                    child: SizedBox(
                      height: 40,
                      child: t != null
                          ? _isPlaying
                              ? const Icon(
                                  Icons.pause,
                                  color: AppColor.whiteColor,
                                  size: 50,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  color: AppColor.whiteColor,
                                  size: 50,
                                )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(
                      value: _progress.isNaN ? 0.0 : _progress,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: AppColor.whiteColor,
                      strokeWidth: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(text: "Please hold tight,\nwhile we fetch your videos", color: AppColor.redColor, size: 16.0, weight: FontWeight.bold, align: TextAlign.center),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
