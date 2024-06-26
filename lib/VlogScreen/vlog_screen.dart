import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class VlogPage extends StatefulWidget {
  final bool video;
  VlogPage({Key? key, required this.video}) : super(key: key);

  @override
  _VlogPageState createState() => _VlogPageState();
}

class _VlogPageState extends State<VlogPage> {
  final List<String> videos = [
    'assets/videos/alone_-_46637.mp4',
    'assets/videos/silhouette_-_12333.mp4',
    'assets/videos/2nd-Clip.mp4'
  ];
  int videoIndex = 0;
  bool likeButton = false;
  bool isPlaying = true;
  VideoPlayerController? _controller;
  VideoPlayerController? _nextController;
  VideoPlayerController? _previousController;
  late PageController _pageController;
  bool _isInitialized = false;
  ValueNotifier<Duration> videoPositionNotifier = ValueNotifier(Duration.zero);

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    initializeVideoControllers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      _isInitialized = true;
      if (widget.video &&
          _controller != null &&
          !_controller!.value.isPlaying) {
        _controller!.play();
        _controller!.addListener(() {
          videoPositionNotifier.value = _controller!.value.position;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _nextController?.dispose();
    _previousController?.dispose();
    _pageController.dispose();
    videoPositionNotifier.dispose();
    super.dispose();
  }

  Future<void> initializeVideoControllers() async {
    _controller = VideoPlayerController.asset(videos[videoIndex]);
    await _controller!.initialize();
    _controller!.setLooping(true);

    _controller!.addListener(() {
      if (mounted) {
        videoPositionNotifier.value = _controller!.value.position;
      }
    });

    if (videoIndex + 1 < videos.length) {
      _nextController = VideoPlayerController.asset(videos[videoIndex + 1]);
      await _nextController!.initialize();
      _nextController!.setLooping(true);
    }

    if (videoIndex - 1 >= 0) {
      _previousController = VideoPlayerController.asset(videos[videoIndex - 1]);
      await _previousController!.initialize();
      _previousController!.setLooping(true);
    }

    setState(() {});
  }

  void switchToNextVideo() {
    if (_nextController != null) {
      _controller?.pause();
      final oldController = _controller;
      _controller = _nextController;
      _nextController = null;
      oldController?.dispose();

      videoIndex++;
      if (videoIndex + 1 < videos.length) {
        _nextController = VideoPlayerController.asset(videos[videoIndex + 1]);
        _nextController!.initialize().then((_) {
          setState(() {});
        });
        _nextController!.setLooping(true);
      }

      if (videoIndex - 1 >= 0) {
        _previousController =
            VideoPlayerController.asset(videos[videoIndex - 1]);
        _previousController!.initialize().then((_) {
          setState(() {});
        });
        _previousController!.setLooping(true);
      }

      setState(() {
        _controller!.play();
        _controller!.addListener(() {
          videoPositionNotifier.value = _controller!.value.position;
        });
      });
    }
  }

  void like() {
    setState(() {
      likeButton = !likeButton;
    });
  }

  void switchToPreviousVideo() {
    if (_previousController != null) {
      _controller?.pause();
      final oldController = _controller;
      _controller = _previousController;
      _previousController = null;
      oldController?.dispose();

      videoIndex--;
      if (videoIndex + 1 < videos.length) {
        _nextController = VideoPlayerController.asset(videos[videoIndex + 1]);
        _nextController!.initialize().then((_) {
          setState(() {});
        });
        _nextController!.setLooping(true);
      }

      if (videoIndex - 1 >= 0) {
        _previousController =
            VideoPlayerController.asset(videos[videoIndex - 1]);
        _previousController!.initialize().then((_) {
          setState(() {});
        });
        _previousController!.setLooping(true);
      }

      setState(() {
        _controller!.play();
        _controller!.addListener(() {
          videoPositionNotifier.value = _controller!.value.position;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            controller: _pageController,
            onPageChanged: (index) {
              if (index == videoIndex + 1) {
                switchToNextVideo();
              } else if (index == videoIndex - 1) {
                switchToPreviousVideo();
              }
            },
            itemBuilder: (context, index) {
              if (index == videoIndex) {
                return _controller != null && _controller!.value.isInitialized
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller!.value.isPlaying) {
                              _controller!.pause(); 
                            } else {
                              _controller!.play();
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: AspectRatio(
                                  aspectRatio: _controller!.value.aspectRatio,
                                  child: VideoPlayer(_controller!)),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.4,
                              left: MediaQuery.of(context).size.width * 0.81,
                              child: SizedBox(
                                height: 220,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          onPressed: () {
                                            like();
                                          },
                                          child: Icon(
                                            Icons.emoji_emotions_outlined,
                                            size: 29,
                                            color: likeButton
                                                ? Color.fromARGB(
                                                    255, 235, 118, 64)
                                                : Colors.white,
                                          ),
                                        ),
                                        const Text(
                                          "12k",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          onPressed: () {},
                                          child: SvgPicture.asset(
                                            "assets/images/img_chat1.svg",
                                            height: 29,
                                          ),
                                        ),
                                        const Text(
                                          "284",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          onPressed: () {},
                                          child: SvgPicture.asset(
                                            "assets/images/img_share41.svg",
                                            height: 29,
                                          ),
                                        ),
                                        const Text(
                                          "112",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.73,
                              left: 15,
                              child: Container(
                                height: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/images/img_rectangle140.png",
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Cerem Johnson",
                                              style: TextStyle(
                                                  fontFamily: "outfit",
                                                  fontSize: 21,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.0, top: 2),
                                              child: Icon(
                                                Icons.check_circle,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 2),
                                          child: Text(
                                            "johnsen.ceren",
                                            style: TextStyle(
                                                fontFamily: "outfit",
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "this is a demo text!!!",
                                            style: TextStyle(
                                                fontFamily: "outfit",
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      _controller!.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_controller!.value.isPlaying) {
                                          _controller!.pause();
                                        } else {
                                          _controller!.play();
                                        }
                                      });
                                    },
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: VideoProgressIndicator(
                                      _controller!,
                                      allowScrubbing: true,
                                      colors: VideoProgressColors(
                                        playedColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ValueListenableBuilder<Duration>(
                                      valueListenable: videoPositionNotifier,
                                      builder: (context, value, child) {
                                        return Text(
                                          "${formatDuration(value)} / ${formatDuration(_controller!.value.duration)}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  color: Colors.black,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
    } else {
      return "${twoDigits(minutes)}:${twoDigits(seconds)}";
    }
  }
}
