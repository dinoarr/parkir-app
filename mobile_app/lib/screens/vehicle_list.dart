import 'package:flutter/material.dart';
import 'package:mobile_app/screens/vehicle_input.dart';

class VehicleList extends StatefulWidget {
  @override
  _VehicleInputState createState() => _VehicleInputState();
}

class _VehicleInputState extends State<VehicleList> {
  // Data statis
  List<Map<String, String>> vehicles = [
    {
      'plate': 'B 6843 VKR',
      'brand': 'Honda',
      'color': 'Merah',
    },
  ];

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.green),
        title: const Text(
          'Your Vehicle',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : vehicles.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: vehicles.length,
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];
                    return Card(
                      elevation: 2.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            vehicle['plate']!,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        title:
                            Text('${vehicle['brand']} - ${vehicle['color']}'),
                        trailing: const Text(
                          'UBAH',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Aksi saat tombol UBAH ditekan
                        },
                      ),
                    );
                  },
                )
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No vehicle available',
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddVehiclePage(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
