import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/scenes/nasa_photos/cubit/nasa_photos_screen_cubit.dart';
import 'package:edu_flutter_app/scenes/nasa_photos/cubit/nasa_photos_screen_state.dart';
import 'package:edu_flutter_app/scenes/nasa_photos/nasa_photos_screen.dart';
import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';

class NasaPhotosPage extends StatefulWidget {
  const NasaPhotosPage({super.key});

  @override
  State<StatefulWidget> createState() => _NasaPhotosPageState();
}

class _NasaPhotosPageState extends State<NasaPhotosPage> {
  List<NasaPhoto> _photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NasaPhotosScreenCubit, NasaPhotosScreenState>(
        builder: (context, state) {
          if (state is LoadingState) {
            BlocProvider.of<NasaPhotosScreenCubit>(context).loadPhotos();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            _photos += state.photos;
            return NasaPhotosScreen(photos: _photos);
          } else if (state is ErrorState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent[100],
              ),
              body: Center(
                child: Column(
                  children: [
                    const Text("Something went wrong"),
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<NasaPhotosScreenCubit>(context).loadPhotos();
                      }, 
                      child: const Text("Try again")
                    )
                  ]
                ),
              ),
            );
          } else { 
            return Container();
          }
        },
      )
    );
  }
}