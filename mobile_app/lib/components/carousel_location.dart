import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/model/location_model.dart';
import 'package:mobile_app/screens/booking.dart';
import 'package:mobile_app/screens/location.dart';

class ParkingNearbySection extends StatelessWidget {
  final List<Location> parkingLocations;

  ParkingNearbySection({required this.parkingLocations});

  @override
  Widget build(BuildContext context) {
    bool isCarouselEnabled = parkingLocations.length > 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Parking Nearby",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationPage(),
                    ),
                  );
                },
                child: const Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF45C47C),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider.builder(
          itemCount: parkingLocations.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final location = parkingLocations[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(location: location),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFF272727)),
                  ),
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lokasi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFA5AAB7),
                                  ),
                                ),
                                Text(
                                  location.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF606470),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "IDR ${location.carPrice.toStringAsFixed(0)}",
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
                        Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.directions_car,
                                size: 16, color: Color(0xFF45C47C)),
                            const SizedBox(width: 4),
                            Text(
                              "${location.carSpots} Car Spots",
                              style: const TextStyle(fontSize: 8),
                            ),
                            const SizedBox(width: 11),
                            const Icon(Icons.motorcycle,
                                size: 16, color: Color(0xFF45C47C)),
                            const SizedBox(width: 4),
                            Text(
                              "${location.bikeSpots} Bike Spots",
                              style: const TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 130,
            autoPlay: isCarouselEnabled,
            enableInfiniteScroll: isCarouselEnabled,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true,
            viewportFraction: 0.7,
          ),
        ),
      ],
    );
  }
}