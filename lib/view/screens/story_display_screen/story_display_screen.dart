import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:gofreindsgo_sales/model/story_model/story_model.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/view/widgets/story_view_screen/appbar.dart';
import 'package:gofreindsgo_sales/view/widgets/story_view_screen/body.dart';
import 'package:gofreindsgo_sales/view/widgets/story_view_screen/loading_indicator.dart';

class StoryDisplayScreen extends StatefulWidget {
  final List<Story> allStories;
  final int currentIndex;

  const StoryDisplayScreen(
      {super.key, required this.allStories, required this.currentIndex});

  @override
  State<StoryDisplayScreen> createState() => _StoryDisplayScreenState();
}

class _StoryDisplayScreenState extends State<StoryDisplayScreen> {
  late PageController _pageController;
  late Timer _timer;
  late int _currentIndex;
  double _progress = 0.0;
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _videoController?.dispose(); // Dispose video controller
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_isCurrentStoryVideo()) {
          // Handle video-specific progress
          if (_videoController != null &&
              _videoController!.value.isInitialized) {
            _progress = _videoController!.value.position.inMilliseconds /
                _videoController!.value.duration.inMilliseconds;
          }
        } else {
          // Regular image story progress
          _progress += 0.01; // Adjust this value to reduce display time
        }

        if (_progress >= 1.0) {
          _progress = 0.0;
          _currentIndex++;
          if (_currentIndex >= widget.allStories.length) {
            _currentIndex = 0; // Loop back to the first story
          }
          _pageController.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  bool _isCurrentStoryVideo() {
    return widget.allStories[_currentIndex].image
        .endsWith('.mp4'); // Check if the current media is a video
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: AppBarOfStoryViewScreen(
              widget: widget, currentIndex: _currentIndex)),
      body: Stack(children: [
        storyViewArea(
          mediaPaths: widget.allStories.map((story) => story.image).toList(),
          pageController: _pageController,
          storyLength: widget.allStories.length,
          callBack: (index) {
            setState(() {
              _currentIndex = index;
              _progress = 0.0;
              _initializeVideoIfNecessary();
            });
          },
        ),
        LoadingIndicatorOnStoryViewScreen(progress: _progress)
      ]),
    );
  }

  void _initializeVideoIfNecessary() {
    if (_isCurrentStoryVideo()) {
      _videoController?.dispose(); // Dispose the previous video controller
      _videoController = VideoPlayerController.network(
        widget.allStories[_currentIndex].image,
      )..initialize().then((_) {
          setState(() {});
          _videoController?.play(); // Autoplay video
        });
    } else {
      _videoController = null; // No video to play
    }
  }
}
