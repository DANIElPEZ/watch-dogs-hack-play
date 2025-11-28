import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ctoshackcity/views/home.dart';

class bootAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateBootAnimation();
}

class stateBootAnimation extends State<bootAnimation> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(
      'assets/boot_animation/boot.mp4',
    )..initialize().then((_) {
        setState(() {});
        controller.play();
      });
    controller.addListener(() {
      if (controller.value.position >= controller.value.duration) {
        navigateMainView();
      }
    });
  }

  void navigateMainView() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.value.isInitialized
          ? Container(
              color: Colors.black,
              child: Transform.scale(
                scale: 2,
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              ))
          : Container(color: Colors.black),
    );
  }
}
