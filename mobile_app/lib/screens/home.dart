import 'package:flutter/material.dart';
import 'package:mobile_app/auth/register.dart';
import 'package:mobile_app/components/carousel_cars.dart';
import 'package:mobile_app/components/carousel_history.dart';
import 'package:mobile_app/components/navigationbar.dart';
import 'package:mobile_app/components/carousel_location.dart';
import 'package:mobile_app/screens/activity_page.dart';
import 'package:mobile_app/screens/location.dart';
import 'package:mobile_app/screens/vehicle_list.dart';
import 'package:mobile_app/screens/wallet.dart';
import 'package:mobile_app/api/repository.dart'; // Import the repository
import 'package:mobile_app/api/locationRepository.dart'; // Import the location repository
import 'package:mobile_app/model/location_model.dart'; // Import the location model

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late Future<List<Location>> _locationsFuture;

  @override
  void initState() {
    super.initState();
    final apiClient = ApiClient();
    final locationRepository = LocationRepository(apiClient: apiClient);
    _locationsFuture = locationRepository.fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: AppBar(
                backgroundColor: const Color(0xFF45C47C),
                title: const Text(
                  "ParkirApp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                  ),
                ],
                elevation: 0,
                automaticallyImplyLeading: false,
              ),
            )
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(
              index: _currentIndex,
              children: [
                FutureBuilder<List<Location>>(
                  future: _locationsFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Location>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No Data Available'));
                    } else {
                      final locations = snapshot.data!;
                      return HomePageContent(parkingLocations: locations);
                    }
                  },
                ),
                LocationPage(),
                ActivityPage(),
                VehicleList(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final List<Location> parkingLocations;

  HomePageContent({required this.parkingLocations});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: const Color(0xFF82F4B1),
            child: const Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enroll Now",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Enjoying park with our app",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ParkingNearbySection(parkingLocations: parkingLocations),
          SizedBox(height: 14),
          HistoryCarousel(),
          SizedBox(height: 14),
          CarouselCars(),
        ],
      ),
    );
  }
}