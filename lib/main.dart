import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Presentation/Screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const ManassaApp());
}

class ManassaApp extends StatefulWidget {
  const ManassaApp({super.key});

  @override
  State<ManassaApp> createState() => _ManassaAppState();
}

class _ManassaAppState extends State<ManassaApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('======================User is currently signed out!');
      } else {
        print('======================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return const SplashScreen();
        }));
  }
}
