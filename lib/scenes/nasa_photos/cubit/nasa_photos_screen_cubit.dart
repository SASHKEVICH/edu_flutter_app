import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/domain/services/nasa_photos_service/nasa_photos_service.dart';
import 'package:edu_flutter_app/scenes/nasa_photos/cubit/nasa_photos_screen_state.dart';

class NasaPhotosScreenCubit extends Cubit<NasaPhotosScreenState> {
  NasaPhotosScreenCubit({required this.photosService}) 
    : super(LoadingState());

  final NasaPhotosService photosService;

  void loadPhotos() async {
    try {
      final photos = await photosService.getNasaPhotoNextPage();
      emit(LoadedState(photos: photos));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }    
  }
}