// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_sphere_app/Constants/constants.dart';
import 'Providers/bottom_nav_provider.dart';
import 'Providers/get_status_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        // ChangeNotifierProvider(create: (_) => GetStatusProvider()),
      ],
      child: MaterialApp(
        title: 'Share Sphere',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(color: cardColor),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
