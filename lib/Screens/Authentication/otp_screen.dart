import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String number;
  OTPScreen(
    this.number,
  );

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 40,
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red.shade200,
            child: const Icon(
              CupertinoIcons.person_alt_circle,
              color: Colors.red,
              size: 60,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Welcome Back',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'We have sent a conformation code to your number',
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: widget.number,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ]),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(labelText: 'Country'),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  onChanged: (value) {},
                  autofocus: true,
                  maxLength: 10,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 22,
                        bottom: 22,
                      ),
                      labelText: 'Number',
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(fontSize: 10, color: Colors.grey)),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
