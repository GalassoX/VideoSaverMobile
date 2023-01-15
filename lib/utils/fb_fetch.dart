import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:video_saver/data/constants.dart';

class FbResponse {
  final String original;
  final String sd;
  final String hd;
  final String title;
  final String thumbnail;

  const FbResponse(
      {required this.original,
      required this.sd,
      required this.hd,
      required this.title,
      required this.thumbnail});

  factory FbResponse.fromJson(Map<String, dynamic> json) {
    return FbResponse(
        original: json['url'],
        sd: json['sd'],
        hd: json['hd'],
        title: json['title'],
        thumbnail: json['thumbnail']);
  }
}

Future<FbResponse> fetchFacebookVideo(String videoUrl) async {
  final response = await http
      .get(Uri.https(apiDomain, '/facebook', {'video_url': videoUrl}));

  if (response.statusCode == 200) {
    return FbResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch facebook video');
  }
}
