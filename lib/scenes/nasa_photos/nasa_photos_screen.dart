import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';
import 'package:flutter/material.dart';

class NasaPhotosScreen extends StatefulWidget {
  const NasaPhotosScreen({super.key, required this.photos});

  final List<NasaPhoto> photos;

  @override
  State<StatefulWidget> createState() => _NasaPhotosScreenState();
}

class _NasaPhotosScreenState extends State<NasaPhotosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rover photo"),
        backgroundColor: Colors.redAccent[100],
      ),
      body: ListView.builder(
        itemCount: widget.photos.length,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.photos[index];
          return ListTile(
            title: Text(item.earthDate ?? ''),
          );
        }
      ),
    );
  }
}