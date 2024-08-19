import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselCars extends StatefulWidget {
  @override
  State<CarouselCars> createState() => _CarouselCarsState();
}

class _CarouselCarsState extends State<CarouselCars> {
  final List<Map<String, String>> cars = [
    {
      "name": "Mercedes Benz C230",
      "number": "B 2380 JEN",
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isCarouselEnabled = cars.length > 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Cars",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
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
        const SizedBox(height: 15),
        CarouselSlider.builder(
          itemCount: cars.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final location = cars[index];
            return GestureDetector(
              onTap: () {},
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
                    width: 250,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.directions_car,
                              size: 24,
                              color: Color(0xFF45C47C),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  location["name"]!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF606470),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  location["number"]!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFA5AAB7),
                                  ),
                                ),
                              ],
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
            height: 100,
            autoPlay: isCarouselEnabled,
            enableInfiniteScroll: isCarouselEnabled,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            viewportFraction: 0.70,
          ),
        ),
      ],
    );
  }
}
