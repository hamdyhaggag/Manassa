import 'package:flutter/material.dart';
import 'Presentation/Screens/splashscreen.dart';

void main() {
  runApp(const ManassaApp());
}

class ManassaApp extends StatelessWidget {
  const ManassaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
    home:Builder(builder: (context){
      return const SplashScreen();
    }));
  }
}


