import 'package:flutter/material.dart';
import 'package:mobile_app/auth/login.dart';
import 'package:mobile_app/components/alert_account.dart';
import 'package:mobile_app/screens/home.dart';
import 'package:mobile_app/components/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Lato', scaffoldBackgroundColor: Color(0xFFF3F6FF)),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const splash();
  }
}
