import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:share_sphere_app/Screens/Authentication/phone_number.dart';
import 'package:share_sphere_app/Screens/main_page.dart';

class AuthUI extends StatelessWidget {
  const AuthUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainActivity()));
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.phone_android_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Continue with Phone",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
          ),
          SizedBox(
            width: 220,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainActivity()));
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Continue with Email",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "OR",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SignInButton(
            Buttons.Google,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainActivity()));
            },
          ),
          SignInButton(
            Buttons.Facebook,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainActivity()));
            },
          ),
        ],
      ),
    );
  }
}
