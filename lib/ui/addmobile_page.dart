// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:groupeii_app/ui/basicinfo_page.dart';
import 'package:groupeii_app/ui/dash_board.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class Addmobile extends StatefulWidget {
  const Addmobile({super.key});

  @override
  State<Addmobile> createState() => _AddmobileState();
}

class _AddmobileState extends State<Addmobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                SizedBox(
                  width: 20,
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashBoard()));
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Add New Merchant"),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Verify mobile number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20),
                        ),

                        SizedBox(
                          height: 6,
                        ),
                        //  TextStyle(color: Colors.black.withOpacity(0.6)),
                        Text("Please Verify Mobile no to proceed"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Enter Retailers phnone number',
                      prefixIcon: Icon(Icons.keyboard_alt_outlined),
                    ),
                  ),
                ),

                //  Text("Please Entre the OTP")
              ],
            ),
            SizedBox(
              height: 50,
            ),
            OutlinedButton(
              style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 231, 196, 43)),
              onPressed: () {
                debugPrint('Received click');
              },
              child: const Text('SEND OTP'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 13, 13, 13),
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {},
              child: const Text('Resend OTP'),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "VERIFY OTP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20),
                        ),

                        SizedBox(
                          height: 6,
                        ),
                        //  TextStyle(color: Colors.black.withOpacity(0.6)),
                        Text("OTP is sent to xxxxxxxx"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                // onCompleted: () {
                //   print("Completed: " );
                // },
              ),
            ),
            OutlinedButton(
              style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 231, 196, 43)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BasicInfoPage()));
              },
              child: const Text('VERIFY OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
