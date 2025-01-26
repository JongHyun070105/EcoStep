import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () { // 주석 해제
      FlutterNativeSplash.remove();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF082B2A),
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/img/logo.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: Text(
                'ECO STEP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: MediaQuery.of(context).size.width * 0.1,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF75C97A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}