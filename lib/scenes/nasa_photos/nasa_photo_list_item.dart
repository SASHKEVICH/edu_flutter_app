import 'package:flutter/material.dart';

import 'package:edu_flutter_app/domain/models/nasa/nasa_photo.dart';

class NasaPhotoListItem extends StatelessWidget {
  final NasaPhoto photoItem;
  
  const NasaPhotoListItem({super.key, required this.photoItem});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(photoItem.imgSrc ?? ''),
          fit: BoxFit.fill
        )
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Earth date: ${photoItem.earthDate ?? ''}", 
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Photo ID: ${photoItem.id}", 
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Camera ID: ${photoItem.camera!.id}", 
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Camera name: ${photoItem.camera!.name}", 
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}