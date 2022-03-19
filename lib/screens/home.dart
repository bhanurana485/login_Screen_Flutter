import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  @override
  _videoPlay() {
    _controller = VideoPlayerController.asset('assets/sample.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  void initState() {
    super.initState();
    _videoPlay();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
            child: Container(
          child: InkWell(
            onTap: () {
              _videoPlay();
            },
            child: Text("Replay video"),
          ),
        ))
        // VideoProgressIndicator(_controller, allowScrubbing: true),
        // _ControlsOverlay(controller: _controller),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        }),
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
    throw UnimplementedError();
  }
}
