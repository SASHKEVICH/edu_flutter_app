import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';

abstract class NasaPhotosScreenState {}

class LoadingState extends NasaPhotosScreenState {}

class LoadedState extends NasaPhotosScreenState {
  final List<NasaPhoto> photos;

  LoadedState({required this.photos});
}

class ErrorState extends NasaPhotosScreenState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
