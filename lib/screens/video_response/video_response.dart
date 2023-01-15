// import 'package:flutter/material.dart';
// import 'package:video_saver/screens/video_response/download_button.dart';
// import 'package:video_saver/utils/ig_fetch.dart';

// class VideoResponse extends StatefulWidget {
//   final String videoUrl;
//   const VideoResponse({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   State<VideoResponse> createState() => _VideoResponseState();
// }

// class _VideoResponseState extends State<VideoResponse> {
//   late Future<IgResponse> futureResponse;
//   String videoTitle = 'Video';

//   @override
//   void initState() {
//     super.initState();

//     futureResponse = fetchInstagramVideo(widget.videoUrl);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(videoTitle),
//       ),
//       body: Center(
//         child: FutureBuilder<IgResponse>(
//           future: futureResponse,
//           builder: (BuildContext context, AsyncSnapshot<IgResponse> snapshot) {
//             const CircularProgressIndicator();
//             if (snapshot.hasData) {
//               videoTitle = 'Video';
//               return DownloadButton(
//                 url: snapshot.data!.url,
//               );
//             } else if (snapshot.hasError) {
//               videoTitle = '${snapshot.error}';
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircularProgressIndicator(),
//                   Text(videoTitle),
//                 ],
//               );
//             } else {
//               videoTitle = snapshot.hasData.toString();
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircularProgressIndicator(),
//                   Text(videoTitle),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text(videoTitle),
//   //     ),
//   //     body: Center(
//   //       child: FutureBuilder<IgResponse>(
//   //         future: futureResponse,
//   //         builder: (BuildContext context, AsyncSnapshot<IgResponse> snapshot) {
//   //           const CircularProgressIndicator();
//   //           if (snapshot.hasData) {
//   //             videoTitle = 'Video';
//   //             return DownloadButton(
//   //               url: snapshot.data!.url,
//   //             );
//   //           } else if (snapshot.hasError) {
//   //             videoTitle = '${snapshot.error}';
//   //             return Column(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 const CircularProgressIndicator(),
//   //                 Text(videoTitle),
//   //               ],
//   //             );
//   //           } else {
//   //             videoTitle = snapshot.hasData.toString();
//   //             return Column(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 const CircularProgressIndicator(),
//   //                 Text(videoTitle),
//   //               ],
//   //             );
//   //           }
//   //         },
//   //       ),
//   //     ),
//   //   );
//   // }
// }

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
