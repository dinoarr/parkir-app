import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/screens/activity_page.dart';

class HistoryCarousel extends StatefulWidget {
  @override
  State<HistoryCarousel> createState() => _HistoryCarouselState();
}

class _HistoryCarouselState extends State<HistoryCarousel> {
  final List<Map<String, String>> historyPlaces = [
    {
      "name": "Nama Tempat 1",
    },
    {
      "name": "Nama Tempat 2",
    },
    {
      "name": "Nama Tempat 3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isCarouselEnabled = historyPlaces.length > 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "History",
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
                      builder: (context) => ActivityPage(),
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
        const SizedBox(height: 5),
        CarouselSlider.builder(
          itemCount: historyPlaces.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final place = historyPlaces[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section
                      Container(
                        height: 90,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/placeholder.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place["name"]!,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Row(
                              children: [
                                Icon(Icons.location_pin,
                                    size: 16, color: Color(0xFFB3B1B0)),
                                SizedBox(width: 5),
                                Text(
                                  "Lokasi",
                                  style: TextStyle(
                                      fontSize: 8, color: Color(0xFFB3B1B0)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 150,
            autoPlay: isCarouselEnabled,
            enableInfiniteScroll: isCarouselEnabled,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: false,
            viewportFraction: 0.40,
          ),
        ),
      ],
    );
  }
}
