import 'package:flutter/material.dart';
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
                  itemCount: vehicles.length,
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];
                    return Card(
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
    );
  }
}
