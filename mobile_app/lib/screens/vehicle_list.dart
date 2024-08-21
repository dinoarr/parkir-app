import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:mobile_app/api/repository.dart'; // Update with actual path
import 'package:mobile_app/api/vehicleRepository.dart'; // Update with actual path
import 'package:mobile_app/model/vehicle_model.dart';
import 'package:mobile_app/screens/vehicle_input.dart'; // Update with actual path

class VehicleList extends StatefulWidget {
  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  List<Vehicle> vehicles = [];
  bool isLoading = true;

  final VehicleApiClient vehicleApiClient = VehicleApiClient(apiClient: ApiClient());

  @override
  void initState() {
    super.initState();
    _fetchVehicles();
  }

  Future<void> _fetchVehicles() async {
    try {
      final vehicleList = await vehicleApiClient.fetchVehicles();
      setState(() {
        vehicles = vehicleList;
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
=======
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
>>>>>>> e846241ea8da6f93893d225cd520e54226e50f62
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
<<<<<<< HEAD
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddVehiclePage()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : vehicles.isEmpty
              ? Center(child: Text('No vehicles found'))
              : ListView.builder(
=======
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : vehicles.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(8.0),
>>>>>>> e846241ea8da6f93893d225cd520e54226e50f62
                  itemCount: vehicles.length,
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];
                    return Card(
<<<<<<< HEAD
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(vehicle.licensePlates),
                        subtitle: Text('${vehicle.brand} ${vehicle.model}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            try {
                              await vehicleApiClient.deleteVehicle(vehicle.id);
                              setState(() {
                                vehicles.removeAt(index);
                              });
                            } catch (e) {
                              // Handle error
                              print(e);
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
=======
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
>>>>>>> e846241ea8da6f93893d225cd520e54226e50f62
    );
  }
}
