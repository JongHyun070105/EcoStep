import 'package:ecostep/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// HomeScreen import

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Step',
      theme: ThemeData(
        primaryColor: Color(0xFF082B2A),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // SplashScreen을 홈으로 설정
    );
  }
}