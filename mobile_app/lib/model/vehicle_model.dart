class Vehicle {
  final int id;
  final String vehicleType;
  final String licensePlates;
  final String brand;
  final String model;

  Vehicle({
    required this.id,
    required this.vehicleType,
    required this.licensePlates,
    required this.brand,
    required this.model,
  });

  // Factory method to create a Vehicle object from a JSON map
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      vehicleType: json['vehicle_type'],
      licensePlates: json['license_plates'],
      brand: json['brand'],
      model: json['model'],
    );
  }

  // Method to convert a Vehicle object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_type': vehicleType,
      'license_plates': licensePlates,
      'brand': brand,
      'model': model,
    };
  }
}
