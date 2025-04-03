import 'package:flutter/material.dart';
import 'view/splash_screen.dart'; // Import de la splash screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guide Me',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // On démarre avec la Splash Screen
    );
  }
}
