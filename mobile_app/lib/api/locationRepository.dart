import 'dart:convert';
import 'package:mobile_app/model/location_model.dart';
import 'package:mobile_app/api/repository.dart';

class LocationRepository {
  final ApiClient apiClient;

  LocationRepository({required this.apiClient});

  // Method untuk mengambil data lokasi
  Future<List<Location>> fetchLocations() async {
    final response = await apiClient.get('parking-places');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((location) => Location.fromJson(location)).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }
}

