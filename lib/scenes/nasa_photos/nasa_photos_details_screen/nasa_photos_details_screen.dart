import 'package:flutter/material.dart';

import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';

class NasaPhotosDetailsScreen extends StatelessWidget {
  final NasaPhoto photo;

  const NasaPhotosDetailsScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_Constants.appTitle),
        backgroundColor: Colors.redAccent[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Photo", style: TextStyle(fontSize: _Constants.defaultFontSize),),
                Text("ID: ${photo.id}"),
                Text("Earth date: ${photo.earthDate}"),
                Text("Sol: ${photo.sol}"),
              ],
            ),
            _Constants.defaultSpacing,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Rover", style: TextStyle(fontSize: _Constants.defaultFontSize),),
                Text("ID: ${photo.rover!.id}"),
                Text("Landing date: ${photo.rover!.landingDate}"),
                Text("Name: ${photo.rover!.name}"),
                Text("Status: ${photo.rover!.status}"),
                Text("Total photos: ${photo.rover!.totalPhotos}"),
              ],
            ),
            _Constants.defaultSpacing,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Camera", style: TextStyle(fontSize: _Constants.defaultFontSize),),
                Text("ID: ${photo.camera!.id}"),
                Text("Fullname: ${photo.camera!.fullName}"),
                Text("Name: ${photo.camera!.name}"),
              ],
            )
          ],
        ),
      )
      
    );
  }
}

class _Constants {
  static const appTitle = 'Details';
  static const defaultFontSize = 18.0;

  static const SizedBox defaultSpacing = SizedBox(height: 30,);
}