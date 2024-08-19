import 'package:flutter/material.dart';
import 'package:mobile_app/auth/login.dart';
import 'package:mobile_app/auth/register.dart';
import 'package:mobile_app/components/carousel_cars.dart';
import 'package:mobile_app/components/carousel_history.dart';
import 'package:mobile_app/components/navigationbar.dart';
import 'package:mobile_app/components/carousel_location.dart';
import 'package:mobile_app/screens/activity_page.dart';
import 'package:mobile_app/screens/location.dart';
import 'package:mobile_app/screens/wallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePageContent(),
    LocationPage(),
    ActivityPage(),
  ];

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
              children: _pages,
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: const Color(0xFF82F4B1),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Enroll Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Start your smart parking now.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 120,
                        height: 30,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffFCFDFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const login(),
                              ),
                            );
                          },
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Color(0xFF45C47C),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.translate(
                    offset: Offset(0, 16),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.wallet_rounded,
                                  color: Color(0xFF45C47C),
                                  size: 36,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'WALLET',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF45C47C),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WalletWidget(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Container(
                height: 200,
                color: Color(0xFFFCFDFF),
                child: ParkingNearbySection(),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Column(
            children: [
              Container(
                height: 200,
                color: Color(0xFFFCFDFF),
                child: HistoryCarousel(),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Column(
            children: [
              Container(
                height: 200,
                color: Color(0xFFFCFDFF),
                child: CarouselCars(),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
