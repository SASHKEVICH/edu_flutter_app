import 'package:edu_flutter_app/domain/models/nasa/camera.dart';
import 'package:edu_flutter_app/domain/models/nasa/rover.dart';

class NasaPhoto {
  int? id;
  int? sol;
  Camera? camera;
  String? imgSrc;
  String? earthDate;
  Rover? rover;

  NasaPhoto(
      {this.id,
      this.sol,
      this.camera,
      this.imgSrc,
      this.earthDate,
      this.rover});

  NasaPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera =
        json['camera'] != null ? new Camera.fromJson(json['camera']) : null;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
    rover = json['rover'] != null ? new Rover.fromJson(json['rover']) : null;
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
    if (this.rover != null) {
      data['rover'] = this.rover!.toJson();
    }
    return data;
  }
}
