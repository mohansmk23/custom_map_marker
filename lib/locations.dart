import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final LatLng coordinates;
  final String name;

  Location(this.coordinates, this.name);
}

List<Location> locations = [
  Location(LatLng(13.192594280276914, 80.30864386287254), "KFC"),
  Location(LatLng(13.190922964992797, 80.3067341301787), "McDonald's"),
  Location(LatLng(13.18791456868715, 80.30750660632454), "Subway"),
  Location(LatLng(13.188269728511436, 80.30568270431355), "Starbucks")
];
