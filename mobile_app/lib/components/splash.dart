import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: screenWidth - 160,
            child: Image.asset(
              'assets/images/circle.png',
              height: 234,
              width: 227,
            ),
          ),
          const Center(
            child: Text('Parkir.App',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
          ),
          Positioned(
            bottom: screenWidth - 400,
            right: screenWidth - 225,
            child: Image.asset(
              'assets/images/line.png',
              height: 234,
              width: 227,
            ),
          ),
        ],
      ),
    ));
  }
}
