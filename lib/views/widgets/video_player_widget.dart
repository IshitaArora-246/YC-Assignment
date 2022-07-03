import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends ConsumerStatefulWidget {
  final String url;
  final bool play;

  const VideoWidget({Key? key, required this.url, required this.play})
      : super(key: key);
  @override
  ConsumerState<VideoWidget> createState() => VideoWidgetState();
}

class VideoWidgetState extends ConsumerState<VideoWidget> {
  late VideoPlayerController _controller;
  late bool isNotScrolling;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _controller.initialize().then((_) {
      setState(() {});
    });

    if (widget.play) {
      _controller.play();
      _controller.setLooping(true);
    }
  }

  @override
  void didUpdateWidget(VideoWidget oldWidget) {
    if (oldWidget.play != widget.play) {
      if (widget.play) {
        _controller.play();
        _controller.setLooping(true);
      } else {
        _controller.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        child: Stack(
          children: [
            if (_controller.value.isPlaying) VideoPlayer(_controller),
            if (!_controller.value.isInitialized)
              Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
