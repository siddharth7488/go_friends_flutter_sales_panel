import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';

PageView storyViewArea({
  required PageController pageController,
  required int storyLength,
  required StoryCallBAck callBack,
  required List<String> mediaPaths, // Updated to take a list of media paths
}) {
  return PageView.builder(
    controller: pageController,
    itemCount: storyLength,
    onPageChanged: (index) {
      callBack(index);
    },
    itemBuilder: (context, index) {
      final mediaPath = mediaPaths[index];
      final isVideo = mediaPath.endsWith('.mp4') ||
          mediaPath.endsWith('.avi'); // Add more formats as needed

      return SizedBox(
        width: double.infinity,
        height: mediaqueryheight(1, context),
        child: isVideo
            ? VideoPlayerWidget(
                videoUrl: API.baseImageUrl + mediaPath) // Video rendering
            : Image.network(
                API.baseImageUrl + mediaPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppImages.goFriendsGoLogo);
                },
              ),
      );
    },
  );
}

typedef StoryCallBAck = void Function(int index);

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerWidget({required this.videoUrl, Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
        _controller.play(); // Auto-play the video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Center(child: CircularProgressIndicator());
  }
}
