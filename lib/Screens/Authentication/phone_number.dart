import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_sphere_app/Constants/constants.dart';
import 'package:share_sphere_app/Services/phone_auth_service.dart';

class PhoneNumberAuth extends StatefulWidget {
  const PhoneNumberAuth({super.key});

  @override
  State<PhoneNumberAuth> createState() => _PhoneNumberAuthState();
}

class _PhoneNumberAuthState extends State<PhoneNumberAuth> {
  bool validate = false;

  var countryCodeController = TextEditingController(text: '+91');
  var phoneNumberController = TextEditingController();

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          SizedBox(
            width: 15,
          ),
          Text('please wait'),
        ],
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  final PhoneAuthService _service = PhoneAuthService();

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
            'Enter your phone number',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'We will send conformation code to this number',
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: countryCodeController,
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
                  onChanged: (value) {
                    if (value.length == 10) {
                      setState(() {
                        validate = true;
                      });
                    }
                    if (value.length < 10) {
                      setState(() {
                        validate = false;
                      });
                    }
                  },
                  autofocus: true,
                  maxLength: 10,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberController,
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: AbsorbPointer(
            absorbing: validate ? false : true,
            child: ElevatedButton(
              onPressed: () {
                String number =
                    '${countryCodeController.text}${phoneNumberController.text}';
                showAlertDialog(context);

                _service.verifyPhoneNumber(context, number);
              },
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: validate
                    ? MaterialStateProperty.all(Color1)
                    : MaterialStateProperty.all(Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
