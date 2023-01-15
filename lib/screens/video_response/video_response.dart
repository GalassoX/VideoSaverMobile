import 'package:flutter/material.dart';
import 'package:video_saver/screens/video_response/download_button.dart';

class VideoResponse extends StatefulWidget {
  final String url;
  const VideoResponse({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoResponse> createState() => _VideoResponseState();
}

class _VideoResponseState extends State<VideoResponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: DownloadButton(url: widget.url),
    );
  }
}
