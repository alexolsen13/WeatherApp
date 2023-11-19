// part "location.g.dart";

class Location{
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  const Location({required this.id, required this.name, required this.latitude, required this.longitude,  });

  // factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(id: json["id"], name: json["name"], latitude: json["latitude"], longitude: json["longitude"]);
  }
}




