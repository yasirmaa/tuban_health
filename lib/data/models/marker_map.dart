class MarkerMap {
  final int? id;
  final String title;
  final String description;
  final String address;
  final double latitude;
  final double longitude;

  MarkerMap({
    this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  MarkerMap copy({
    int? id,
    String? title,
    String? description,
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return MarkerMap(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  static MarkerMap fromJson(Map<String, Object?> json) {
    return MarkerMap(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
      };
}
