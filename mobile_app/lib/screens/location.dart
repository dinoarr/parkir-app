import 'package:flutter/material.dart';
import 'package:mobile_app/model/location_model.dart';
import 'package:mobile_app/api/repository.dart';
import 'package:mobile_app/api/locationRepository.dart';
import 'package:mobile_app/screens/booking.dart';
import 'package:mobile_app/screens/home.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late Future<List<Location>> futureLocations;
  late LocationRepository locationRepository;

  @override
  void initState() {
    super.initState();
    // Initialize the repository
    locationRepository = LocationRepository(apiClient: ApiClient());
    futureLocations = locationRepository.fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
            ),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF686D76),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Find parking location',
                    prefixIcon: Icon(Icons.search, color: Colors.green),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder<List<Location>>(
          future: futureLocations,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No locations found'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final location = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) {
                           return BookingPage(location: location); // Pass location details to BookingPage if needed
                          },
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(5.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      color: Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location.address,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      location.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "IDR ${location.carPrice}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF45C47C),
                                      ),
                                    ),
                                    const Text(
                                      "Per hour",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Color(0xFFA5AAB7),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.directions_car,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 4),
                                Text('${location.carSpots} Car Spots'),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.motorcycle,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 4),
                                Text('${location.bikeSpots} Bike Spots'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
