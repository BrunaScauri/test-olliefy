import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart'; 

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  const VideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final Player _player;
  late final VideoController _videoController;

  @override
  void initState() {
    super.initState();
    _player = Player();
    _videoController = VideoController(
      _player,
      configuration: const VideoControllerConfiguration(
        enableHardwareAcceleration: true,
        height: 800,
      ),
      
    );
    _player.open(Media(widget.videoUrl));
    _player.setPlaylistMode(PlaylistMode.loop);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(
      controller: _videoController,
      fit: BoxFit.cover,
      controls: NoVideoControls,
    );
  }
}
