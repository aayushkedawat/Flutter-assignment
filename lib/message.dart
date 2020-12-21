import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videos_player/model/control.model.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/videos_player.dart';

class MessageWidget extends StatefulWidget {
  final String content;
  final String imageAddress;
  final String time;
  final bool isImage;
  final bool isVideo;
  final bool isAudio;
  final bool isSent;
  const MessageWidget(
      {Key key,
      this.content,
      this.time,
      this.imageAddress,
      this.isImage,
      this.isAudio,
      this.isSent,
      this.isVideo})
      : super(key: key);

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  // VideoPlayerController _controller;
  // Duration duration;
  // Duration position;

  AudioPlayer audioPlayer = AudioPlayer();
  Duration totalDuration;
  Duration position;
  bool isPlaying = false;

  initAudio() {
    // audioPlayer.play(
    //   'https://luan.xyz/files/audio/ambient_c_motion.mp3',
    // );

    audioPlayer.onDurationChanged.listen((updatedDuration) {
      setState(() {
        totalDuration = updatedDuration;
      });
      print(totalDuration);
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
      setState(() {
        position = updatedPosition;
      });
      print(position);
    });
  }

  playAudio() {
    audioPlayer.play(
      'https://luan.xyz/files/audio/ambient_c_motion.mp3',
    );
    setState(() {
      isPlaying = true;
    });
  }

  pauseAudio() {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  seekAudio(Duration d) {
    audioPlayer.seek(d);
  }

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      // _controller = VideoPlayerController.network(
      //     'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      //   ..initialize().then((_) {
      //     setState(() {
      //       _controller.play();
      //     });
      //   });
    }
    if (widget.isAudio) {
      initAudio();
    }
  }

  @override
  void dispose() {
    super.dispose();
    // if (_controller.value != null) if (_controller.value.isPlaying) {
    //   _controller.pause();
    // }
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: widget.isSent
            ? const EdgeInsets.only(
                right: 8.0, left: 175.0, top: 10.0, bottom: 10.0)
            : const EdgeInsets.only(
                right: 175.0, left: 8.0, top: 8.0, bottom: 8.0),
        child: ClipRRect(
          borderRadius: widget.isSent
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
          child: Container(
            color: widget.isSent ? Colors.blue[500] : Colors.orange[400],
            // margin: const EdgeInsets.only(left: 10.0),
            child: !widget.isAudio
                ? Stack(children: <Widget>[
                    if (!widget.isImage && !widget.isVideo)
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 12.0, left: 23.0, top: 8.0, bottom: 15.0),
                        child: Text(
                          widget.content,
                        ),
                      )
                    else // if (!widget.isAudio)
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 12.0, left: 23.0, top: 8.0, bottom: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: widget.isVideo
                                  ? VideosPlayer(networkVideos: [
                                      NetworkVideo(
                                          id: "3",
                                          name: "Big Buck Bunny",
                                          videoUrl:
                                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                                          thumbnailUrl:
                                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
                                          videoControl: new NetworkVideoControl(
                                              allowFullScreen: true,
                                              showControls: false,
                                              autoPlay: true))
                                    ])
                                  // ? _controller.value.initialized
                                  //     ? AspectRatio(
                                  //         aspectRatio:
                                  //             _controller.value.aspectRatio,
                                  //         child: VideoPlayer(_controller),
                                  //       )
                                  //     : Container(child: Text('dkhkfj'))
                                  : Image.network(
                                      widget.imageAddress,
                                      height: 130,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.content,
                            )
                          ],
                        ),
                      ),
                    // if (widget.isAudio)
                    Positioned(
                      bottom: 2,
                      left: 10,
                      child: Text(
                        widget.time,
                        style: TextStyle(
                            fontSize: 10, color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ])
                : Padding(
                    padding: const EdgeInsets.only(
                        right: 12.0, left: 0.0, top: 8.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: isPlaying
                              ? Icon(Icons.pause)
                              : Icon(Icons.play_arrow),
                          onPressed: () {
                            isPlaying ? pauseAudio() : playAudio();
                          },
                        ),
                        // if (isPlaying)
                        Expanded(
                          child: Slider(
                            value: position == null
                                ? 0
                                : position.inSeconds.toDouble(),
                            onChanged: (d) {
                              seekAudio(Duration(seconds: d.toInt()));
                            },
                            max: totalDuration == null
                                ? 100
                                : totalDuration.inSeconds.toDouble(),
                            activeColor: Colors.green,
                            label: totalDuration.toString(),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
