import 'package:flutter/material.dart';
import 'package:video_saver/screens/video_response/video_response.dart';
import 'package:video_saver/utils/ig_fetch.dart';

class SearchVideo extends StatefulWidget {
  const SearchVideo({Key? key}) : super(key: key);

  @override
  State<SearchVideo> createState() => _SearchVideoState();
}

class _SearchVideoState extends State<SearchVideo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  String textSearchButton = 'Buscar';

  final List<String> urlChecks = ['facebook', 'instagram'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Introduce el link',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa algun link';
              }
              bool valid = false;
              for (var word in urlChecks) {
                if (value.contains(word)) {
                  valid = true;
                }
              }
              if (!valid) {
                return 'Solo se permiten URLs que contengan las palabras ${urlChecks.toString()}';
              }
              return null;
            },
            controller: searchController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              child: Text(textSearchButton),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _fetchVideo(context);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void _fetchVideo(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text('Buscando...'),
                ],
              ),
            ),
          );
        });

    IgResponse r = await fetchInstagramVideo(searchController.text);
    Navigator.of(context).pop();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoResponse(
          url: r.url,
        ),
      ),
    );
  }
}
