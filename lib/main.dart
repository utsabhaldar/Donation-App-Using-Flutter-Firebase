// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:share_sphere_app/Constants/constants.dart';
import 'Screens/splash_screen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Sphere',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Color2),
      ),
      home: const SplashScreen(),
    );
  }
}
