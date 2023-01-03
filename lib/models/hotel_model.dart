import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zambo_tour_app/utils/geopoint_convertion.dart';
import 'package:zambo_tour_app/utils/num_convertion.dart';

class Hotel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final LatLng location;

  const Hotel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.location,
  });

  Hotel.fromJson(Map<String, dynamic> res, String id)
      : this(
            id: id,
            title: res['title'] as String,
            description: res['description'] as String,
            imageUrl: res['imageUrl'] as String,
            rating: convertRating(res['rating']),
            location: convertGeoPoint(res['location'] as GeoPoint));
}
