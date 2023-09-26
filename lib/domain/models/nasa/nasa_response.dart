import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';

class NasaResponse {
  List<NasaPhoto>? photos;

  NasaResponse({this.photos});

  NasaResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonPhotos = json['photos'];
    photos = List.generate(jsonPhotos.length, (index) {
      NasaPhoto photo = NasaPhoto.fromJson(jsonPhotos[index]);
      return photo;
    });
  }
}