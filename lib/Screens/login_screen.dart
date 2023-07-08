import 'package:flutter/material.dart';
import 'package:share_sphere_app/Constants/constants.dart';
import 'package:share_sphere_app/Widgets/auth_UI.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color1,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/without_bg.png',
                  ),
                  Text(
                    "    the Love by Sharing",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: AuthUI(),
          ),
        ],
      ),
    );
  }
}
