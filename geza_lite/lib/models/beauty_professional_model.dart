import 'package:google_maps_flutter/google_maps_flutter.dart';

class BeautyProfessionals {
  String? image;
  String? gezabeautyappName;
  String? address;
  String? rating;
  String? reviews;
  bool? isFavorite;
  LatLng? locationCoords;

  BeautyProfessionals(
      {this.image,
      this.gezabeautyappName,
      this.address,
      this.rating,
      this.reviews,
      this.isFavorite,
      this.locationCoords});
}

final List<BeautyProfessionals> nearbyBeautyProfessionalList = [
  BeautyProfessionals(
    image: 'assets/serviceproviders/salon2.png',
    gezabeautyappName: 'Crown gezabeautyapp',
    address: '9 Sector 16,Samora M, Mutare',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.745803, -73.988213),
  ),
  BeautyProfessionals(
    image: 'assets/serviceproviders/salon3.png',
    gezabeautyappName: 'RedBox gezabeautyapp',
    address: '9 Sector 16,Samora M, Mutare',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.730148, -73.999639),
  ),
  BeautyProfessionals(
    image: 'assets/serviceproviders/salon4.png',
    gezabeautyappName: 'Ultra unisex gezabeautyapp',
    address: '9 Sector 16,Samora M, Mutare',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.721622, -74.004308),
  ),
  BeautyProfessionals(
    image: 'assets/serviceproviders/salon5.png',
    gezabeautyappName: 'Livestyle BeautyProfessional',
    address: '9 Sector 16,Samora M, Mutare',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.751908, -73.989804),
  ),
];
