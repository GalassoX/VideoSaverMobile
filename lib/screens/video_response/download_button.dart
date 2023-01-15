import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class DownloadButton extends StatefulWidget {
  final String url;
  const DownloadButton({Key? key, required this.url}) : super(key: key);

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool downloading = false;

  final SnackBar snackBar = const SnackBar(content: Text('Video descargado.'));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Dale click al botón para descargar.'),
          const SizedBox(height: 30),
          ElevatedButton(
            child: Text(!downloading ? 'Descargar' : 'Descargando...'),
            onPressed:
                downloading ? null : () => _onButtonDownloadPressed(widget.url),
          ),
        ],
      ),
    );
  }

  void _onButtonDownloadPressed(String url) {
    setState(() {
      downloading = true;
    });
    GallerySaver.saveVideo(url, albumName: 'VideoSaver').then((value) {
      setState(() {
        downloading = false;
      });
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
