import 'package:flutter/material.dart';

class AddVehiclePage extends StatefulWidget {
  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  String? selectedVehicleType = 'Mobil';
  final List<Map<String, dynamic>> vehicleTypes = [
    {'type': 'Mobil', 'icon': Icons.directions_car},
    {'type': 'Motor', 'icon': Icons.motorcycle},
  ];

  final TextEditingController plateController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();

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
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios),
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
                    onPressed: () {
                      // Aksi saat tombol "Tambah Kendaraan" ditekan
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
