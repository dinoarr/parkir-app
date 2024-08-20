class Location {
  final String name;
  final String address;
  final int carSpots;
  final int bikeSpots;
  final double carPrice;
  final double bikePrice;

  Location({
    required this.name,
    required this.address,
    required this.carSpots,
    required this.bikeSpots,
    required this.carPrice,
    required this.bikePrice,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['place_name'] ?? 'Unknown',
      address: json['location'] ?? 'Unknown',
      carSpots: json['car_spots'] ?? 0,
      bikeSpots: json['bike_spots'] ?? 0,
      carPrice: _parseDouble(json['car_price']),
      bikePrice: _parseDouble(json['bike_price']),
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is String) return double.tryParse(value) ?? 0.0;
    if (value is num) return value.toDouble();
    return 0.0;
  }
}
