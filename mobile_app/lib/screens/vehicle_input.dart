import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:mobile_app/api/repository.dart'; // Update with actual path
import 'package:mobile_app/api/vehicleRepository.dart'; // Update with actual path
import 'package:mobile_app/model/vehicle_model.dart'; // Update with actual path
=======
>>>>>>> e846241ea8da6f93893d225cd520e54226e50f62

class AddVehiclePage extends StatefulWidget {
  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  String? selectedVehicleType = 'Mobil';
<<<<<<< HEAD
  final TextEditingController plateController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final VehicleApiClient vehicleApiClient = VehicleApiClient(apiClient: ApiClient());

  // Define the list of vehicle types and their associated icons
  final List<Map<String, dynamic>> vehicleTypes = [
    {'type': 'Mobil', 'icon': Icons.directions_car},
    {'type': 'Motor', 'icon': Icons.motorcycle},
  ];
=======
  final List<Map<String, dynamic>> vehicleTypes = [
    {'type': 'Mobil', 'icon': Icons.directions_car},
    {'type': 'Motor', 'icon': Icons.motorcycle},
  ];

  final TextEditingController plateController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
>>>>>>> e846241ea8da6f93893d225cd520e54226e50f62

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Kendaraan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF45c47c),
        leading: IconButton(
<<<<<<< HEAD
          icon: Icon(Icons.arrow_back),
=======
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios),
>>>>>>> e846241ea8da6f93893d225cd520e54226e50f62
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Kendaraan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: vehicleTypes.map((vehicle) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedVehicleType = vehicle['type'];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedVehicleType == vehicle['type']
                              ? Color(0xFF45C47C)
                              : Colors.grey[300],
                        ),
                        child: Icon(
                          vehicle['icon'],
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                controller: plateController,
                label: 'Plat No. Kendaraan',
                hintText: 'B 1234 CDE',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                controller: brandController,
                label: 'Brand',
                hintText: 'Masukkan brand kendaraan',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                controller: modelController,
                label: 'Model',
                hintText: 'Masukkan model kendaraan',
              ),
              SizedBox(height: 24.0),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.85,
                  child: ElevatedButton(
<<<<<<< HEAD
                    onPressed: () async {
                      try {
                        final vehicle = Vehicle(
                          id: 0, // The ID will be generated by the server
                          vehicleType: selectedVehicleType!,
                          licensePlates: plateController.text,
                          brand: brandController.text,
                          model: modelController.text,
                        );
                        await vehicleApiClient.addVehicle(vehicle);
                        Navigator.pop(context);
                      } catch (e) {
                        // Handle error
                        print(e);
                      }
=======
                    onPressed: () {
                      // Aksi saat tombol "Tambah Kendaraan" ditekan
>>>>>>> e846241ea8da6f93893d225cd520e54226e50f62
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF04E762),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Tambah Kendaraan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hintText,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.85,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          prefixIcon: label == 'Brand'
              ? Icon(Icons.directions_car)
              : label == 'Model'
                  ? Icon(Icons.model_training)
                  : label == 'Plat No. Kendaraan'
                      ? Icon(Icons.confirmation_num)
                      : null,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
