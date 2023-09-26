import 'package:edu_flutter_app/domain/models/nasa/camera.dart';

class NasaPhoto {
  int? id;
  int? sol;
  Camera? camera;
  String? imgSrc;
  String? earthDate;

  NasaPhoto({this.id, this.sol, this.camera, this.imgSrc, this.earthDate});

  NasaPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera =
        json['camera'] != null ? new Camera.fromJson(json['camera']) : null;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sol'] = this.sol;
    if (this.camera != null) {
      data['camera'] = this.camera!.toJson();
    }
    data['img_src'] = this.imgSrc;
    data['earth_date'] = this.earthDate;
    return data;
  }
}