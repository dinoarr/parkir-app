import 'package:flutter/material.dart';
import 'package:mobile_app/components/modal_booking.dart';
import 'package:mobile_app/model/location_model.dart';
import 'package:mobile_app/screens/location.dart';

class BookingPage extends StatelessWidget {
  final Location location;

  const BookingPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 206,
              width: double.infinity,
              color: Color(0xFFD9D6D4),
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF45C47C),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: Offset(0, 50),
                      child: Container(
                        width: 310,
                        height: 108,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        location.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "IDR ${location.carPrice}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF45C47C),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Spots For",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF606470),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.motorcycle,
                                      color: Color(0xFF45C47C),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.directions_car,
                                      color: Color(0xFF45C47C),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
            Container(
              color: Color(0xFFF5F3F4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Price List',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down_circle_sharp,
                      color: Color(0xFF45C47C),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) {
                          return Modal(location: location);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
