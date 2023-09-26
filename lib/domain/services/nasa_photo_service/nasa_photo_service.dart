import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';
import 'package:edu_flutter_app/domain/requests/nasa_request.dart';

class NasaPhotoService {
  int _page = 1;

  Future<List<NasaPhoto>> getNasaPhotoNextPage() async {
    try {
      var apiData = await NasaRequest.getNextPageNasaPhotos(_page);

      var nasaPhotos = List.generate(apiData.length, (index) {
        NasaPhoto photo = NasaPhoto.fromJson(apiData[index]);
        return photo;
      });

      _page++;
      
      return nasaPhotos;
    } catch (e) {
      rethrow;
    }
  }
}