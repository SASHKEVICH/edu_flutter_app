import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';
import 'package:edu_flutter_app/domain/models/nasa/nasa_response.dart';
import 'package:edu_flutter_app/domain/requests/nasa_request.dart';

class NasaPhotosService {
  int _page = 1;

  Future<List<NasaPhoto>> getNasaPhotoNextPage() async {
    try {
      var apiData = await NasaRequest.getNextPageNasaPhotos(_page);
      NasaResponse response = NasaResponse.fromJson(apiData);

      if (response.photos == null) {
        throw Exception('Photos are empty');
      }

      _page++;
      return response.photos!;
    } catch (e) {
      rethrow;
    }
  }
}