import 'package:flutter/material.dart';
import 'package:video_saver/screens/search_video.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
      ),
      body: const SearchVideo(),
    );
  }
}
