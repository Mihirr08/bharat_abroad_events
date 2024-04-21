import 'package:bharat_abroad_events/home_page.dart';
import 'package:bharat_abroad_events/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBeh6iy6lBDl7XAmBObDzjT0CuXpYrmolg",
          authDomain: "bharat-abroad-events.firebaseapp.com",
          projectId: "bharat-abroad-events",
          storageBucket: "bharat-abroad-events.appspot.com",
          messagingSenderId: "702360281115",
          appId: "1:702360281115:web:f6b1c74bc472f287c818be"
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConstants.royalBlueTheme,
      home: const HomePage(),
    );
  }
}
