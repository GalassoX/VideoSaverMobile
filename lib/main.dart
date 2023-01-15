import 'package:flutter/material.dart';
import 'package:video_saver/screens/home.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VideoSaver',
      home: HomeScreen(),
    );
  }
}
