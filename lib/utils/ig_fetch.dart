import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:video_saver/data/constants.dart';

class IgResponse {
  final String url;

  const IgResponse({required this.url});

  factory IgResponse.fromJson(Map<String, dynamic> json) {
    return IgResponse(url: json['url']);
  }
}

Future<IgResponse> fetchInstagramVideo(String videoUrl) async {
  final response = await http
      .get(Uri.https(apiDomain, '/instagram', {'video_url': videoUrl}));

  if (response.statusCode == 200) {
    return IgResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch');
  }
}
