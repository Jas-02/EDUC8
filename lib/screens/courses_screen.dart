import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Free Courses',
                style: TextStyle(
                  color: const Color(0xFF0C141C),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.33,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const YoutubePlayerThumbnailExample(
                videoId: 'lFqxenB9CX8',
              ),
              SizedBox(
                height: 20.h,
              ),
              const YoutubePlayerThumbnailExample(
                videoId: 'JDOXKqF60RQ',
              ),
              SizedBox(
                height: 20.h,
              ),
              const YoutubePlayerThumbnailExample(
                videoId: '5_5oE5lgrhw&list=PLu0W_9lII9ahIappRPN0MCAgtOu3lQjQi',
              ),
              SizedBox(
                height: 20.h,
              ),
              const YoutubePlayerThumbnailExample(
                videoId: 'BsDoLVMnmZs',
              ),
              SizedBox(
                height: 20.h,
              ),
              const YoutubePlayerThumbnailExample(
                videoId: 'z0n1aQ3IxWI',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class YoutubePlayerThumbnailExample extends StatefulWidget {
  final String videoId;

  const YoutubePlayerThumbnailExample({Key? key, required this.videoId})
      : super(key: key);

  @override
  _YoutubePlayerThumbnailExampleState createState() =>
      _YoutubePlayerThumbnailExampleState();
}

class _YoutubePlayerThumbnailExampleState
    extends State<YoutubePlayerThumbnailExample> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _controller.addListener(() {
      if (_controller.value.isReady && !_isPlayerReady) {
        setState(() {
          _isPlayerReady = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            progressColors: const ProgressBarColors(
              playedColor: Colors.blue,
              handleColor: Colors.blueAccent,
            ),
            onReady: () {
              // Add listener for player initialization
            },
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Show thumbnail when the video is not playing
                player == null ? Image.asset('assets/thumbnail.png') : player,
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

