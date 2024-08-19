import 'package:flutter/material.dart';

class AlertParked extends StatelessWidget {
  const AlertParked({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFF04E762),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: screenWidth - 160,
                child: Image.asset(
                  'assets/images/circle1.png',
                  height: 234,
                  width: 227,
                ),
              ),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/success.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Success!",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Success, you have\n successfully parked",
                      style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: screenWidth - 195,
                child: Image.asset(
                  'assets/images/line3.png',
                  height: 234,
                  width: 227,
                ),
              ),
            ],
          ),
        ));
  }
}
