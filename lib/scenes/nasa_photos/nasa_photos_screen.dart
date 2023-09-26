import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';
import 'package:edu_flutter_app/scenes/nasa_photos/cubit/nasa_photos_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NasaPhotosScreen extends StatefulWidget {
  const NasaPhotosScreen({super.key, required this.photos});

  final List<NasaPhoto> photos;

  @override
  State<StatefulWidget> createState() => _NasaPhotosScreenState();
}

class _NasaPhotosScreenState extends State<NasaPhotosScreen> {
  final int _nextPageTrigger = 20;

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

          if (index == widget.photos.length - _nextPageTrigger) {
            BlocProvider.of<NasaPhotosScreenCubit>(context).loadPhotos();
          }

          if (index == widget.photos.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              )
            );
          }

          return ListTile(
            title: Text(item.earthDate ?? ''),
          );
        }
      ),
    );
  }
}