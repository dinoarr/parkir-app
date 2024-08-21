import 'dart:convert';
import 'package:mobile_app/model/vehicle_model.dart';
import 'package:mobile_app/api/repository.dart'; // Update with actual path

class VehicleApiClient {
  final ApiClient apiClient;

  VehicleApiClient({required this.apiClient});

  // Metode untuk mengambil daftar kendaraan
  Future<List<Vehicle>> fetchVehicles() async {
    final response = await apiClient.get('vehicles');
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Vehicle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicles');
    }
  }

  // Metode untuk menambahkan kendaraan
  Future<void> addVehicle(Vehicle vehicle) async {
    final response = await apiClient.post(
      'vehicles',
      vehicle.toJson(),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add vehicle');
    }
  }

  // Metode untuk menghapus kendaraan
  Future<void> deleteVehicle(int id) async {
    final response = await apiClient.delete('vehicles/$id');
    if (response.statusCode != 200) {
      throw Exception('Failed to delete vehicle');
    }
  }
}
