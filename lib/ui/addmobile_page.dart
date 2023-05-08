// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:groupeii_app/helper/serice_locator.dart';
import 'package:groupeii_app/services/dio_service.dart';
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
  String phone = "";
  String otp = "";
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _otprecived = TextEditingController();
  // OtpFieldController otpController = OtpFieldController();

  Future<Map<String, dynamic>?> sendotp() async {
    String url = "/auth/send-otp";

    Map<String, dynamic> data = {
      "recipient": _numberController.text,
      "login_type": 'mobile_app',
      "recaptcha": "test_recaptcha"
    };
    // String? token = await getIt<SharedPreferences>().getString("token");

    Map<String, dynamic>? responseData = await getIt<DioClient>().post(
        url,
        data,
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdiI6ImViMzczM2ExZmRjMWM3NDRmMzdiZjdhZDQ0YjgyMmIzIiwiY29udGVudCI6IjZmMjc0NTdjYzYyMTg4NjFlM2IyZTI4YmNiMWI3M2NiM2UzNmNlMWU4OTRlMWNmYmNjYWNmMGRkMTU5ZDFjZjgxZWE1YmYzZGQ4OWVjZDM5YTMxYmNhMDRhZTlkMzUwOWE1MTY0M2Q2MzExMWMyYzgyYTc4YjJmMDdlZWNmMzM3NDdmMDE5ZDA3ZjIzNWEyNDM0MTdiMzI0ZGQyOTBhIiwiaWF0IjoxNjgyNDIxMzU1LCJleHAiOjE2ODI0NTAxNTV9.ERozGEQnX2Y3Wi4Ipgw4XTQz4oFnqvqHJ1vshEi-4rohnUX4S46GHVl7crSVVTiAANCoa-KaNrBeYT1XQNPyyt_kvNzxMKB5_cn3ag4sk8vSyon3p83OiQ57wYF2ZZsloFEo1OPv5Y2cCumsCgWP9sz2SR-yyrDdfRtG-sZVtbub7KgFyKo5bHfiGEB9tchJTTDS43peA0GVfjcVu6CluIfaPjGrhpTeIt6UU9wZTdur9Jn1tEQzH0hjT7e84o1uxMbkOHC4XAB9mh54lvme5zm2cvQ67vO0cGnGVevByvXJwXsrQsi34oSDMW_STz_V5ujmRzuDkHU-7qD1n2wEmqSlzFFHFESODkHUaso_RgGr0_6QHebvzTaZnPm4jM1GBAB23gCKvv9B2LCHTy_hcO0GTBD-mgyyTNB0RAwbN7dPxp8OVOdV-UQLt3Y3Af6gSplTjDVOxTGcR3t_yow0nXc1k_JM6GShXQr9go8_u7bpGAvP0BuTz8NPAwUmKygu");

    try {
      if (responseData != null) {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const DashBoard()));
        //print(responseData);
        print(responseData);
      }
    } catch (e) {
      print(e);
    }

    return responseData;
  }

  Future<Map<String, dynamic>?> verifyotp() async {
    String url = "/auth/verify-otp";

    Map<String, dynamic> data = {
      "recipient": _numberController.text,
      "otp": _otprecived.text,
      "login_type": 'mobile_app',
      "recaptcha": "test_recaptcha"
    };
    // String? token = await getIt<SharedPreferences>().getString("token");

    Map<String, dynamic>? responseData = await getIt<DioClient>().post(
        url,
        data,
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdiI6ImViMzczM2ExZmRjMWM3NDRmMzdiZjdhZDQ0YjgyMmIzIiwiY29udGVudCI6IjZmMjc0NTdjYzYyMTg4NjFlM2IyZTI4YmNiMWI3M2NiM2UzNmNlMWU4OTRlMWNmYmNjYWNmMGRkMTU5ZDFjZjgxZWE1YmYzZGQ4OWVjZDM5YTMxYmNhMDRhZTlkMzUwOWE1MTY0M2Q2MzExMWMyYzgyYTc4YjJmMDdlZWNmMzM3NDdmMDE5ZDA3ZjIzNWEyNDM0MTdiMzI0ZGQyOTBhIiwiaWF0IjoxNjgyNDIxMzU1LCJleHAiOjE2ODI0NTAxNTV9.ERozGEQnX2Y3Wi4Ipgw4XTQz4oFnqvqHJ1vshEi-4rohnUX4S46GHVl7crSVVTiAANCoa-KaNrBeYT1XQNPyyt_kvNzxMKB5_cn3ag4sk8vSyon3p83OiQ57wYF2ZZsloFEo1OPv5Y2cCumsCgWP9sz2SR-yyrDdfRtG-sZVtbub7KgFyKo5bHfiGEB9tchJTTDS43peA0GVfjcVu6CluIfaPjGrhpTeIt6UU9wZTdur9Jn1tEQzH0hjT7e84o1uxMbkOHC4XAB9mh54lvme5zm2cvQ67vO0cGnGVevByvXJwXsrQsi34oSDMW_STz_V5ujmRzuDkHU-7qD1n2wEmqSlzFFHFESODkHUaso_RgGr0_6QHebvzTaZnPm4jM1GBAB23gCKvv9B2LCHTy_hcO0GTBD-mgyyTNB0RAwbN7dPxp8OVOdV-UQLt3Y3Af6gSplTjDVOxTGcR3t_yow0nXc1k_JM6GShXQr9go8_u7bpGAvP0BuTz8NPAwUmKygu");

    try {
      if (responseData != null) {
        return responseData;
        print(responseData);
      }
    } catch (e) {
      print(e);
    }

    return responseData;
  }

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>?> verifyotp() async {
      String url = "/auth/verify-otp";

      Map<String, dynamic> data = {
        "mobileNumber": _numberController.text,
        "otp": _otprecived.text,
        // "login_type": 'mobile_app',
        // "recaptcha": "test_recaptcha"
      };
      // String? token = await getIt<SharedPreferences>().getString("token");

      Map<String, dynamic>? responseData = await getIt<DioClient>().post(
          url,
          data,
          "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdiI6ImViMzczM2ExZmRjMWM3NDRmMzdiZjdhZDQ0YjgyMmIzIiwiY29udGVudCI6IjZmMjc0NTdjYzYyMTg4NjFlM2IyZTI4YmNiMWI3M2NiM2UzNmNlMWU4OTRlMWNmYmNjYWNmMGRkMTU5ZDFjZjgxZWE1YmYzZGQ4OWVjZDM5YTMxYmNhMDRhZTlkMzUwOWE1MTY0M2Q2MzExMWMyYzgyYTc4YjJmMDdlZWNmMzM3NDdmMDE5ZDA3ZjIzNWEyNDM0MTdiMzI0ZGQyOTBhIiwiaWF0IjoxNjgyNDIxMzU1LCJleHAiOjE2ODI0NTAxNTV9.ERozGEQnX2Y3Wi4Ipgw4XTQz4oFnqvqHJ1vshEi-4rohnUX4S46GHVl7crSVVTiAANCoa-KaNrBeYT1XQNPyyt_kvNzxMKB5_cn3ag4sk8vSyon3p83OiQ57wYF2ZZsloFEo1OPv5Y2cCumsCgWP9sz2SR-yyrDdfRtG-sZVtbub7KgFyKo5bHfiGEB9tchJTTDS43peA0GVfjcVu6CluIfaPjGrhpTeIt6UU9wZTdur9Jn1tEQzH0hjT7e84o1uxMbkOHC4XAB9mh54lvme5zm2cvQ67vO0cGnGVevByvXJwXsrQsi34oSDMW_STz_V5ujmRzuDkHU-7qD1n2wEmqSlzFFHFESODkHUaso_RgGr0_6QHebvzTaZnPm4jM1GBAB23gCKvv9B2LCHTy_hcO0GTBD-mgyyTNB0RAwbN7dPxp8OVOdV-UQLt3Y3Af6gSplTjDVOxTGcR3t_yow0nXc1k_JM6GShXQr9go8_u7bpGAvP0BuTz8NPAwUmKygu");

      try {
        if (responseData != null) {
          return responseData;
        }
      } catch (e) {
        print(e);
      }

      return responseData;
    }

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
                    maxLength: 10,
                    controller: _numberController,
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
                // debugPrint('Received click');
                sendotp();
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
              onPressed: () {
                sendotp();
              },
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
              child: TextFormField(
                controller: _otprecived,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  labelText: 'Please Enter OTP',
                  prefixIcon: Icon(Icons.keyboard_alt_outlined),
                ),
              ),

              //  OTPTextField(
              //   // controller: otpController,

              //   length: 4,
              //   width: MediaQuery.of(context).size.width,
              //   fieldWidth: 80,
              //   style: TextStyle(fontSize: 17),
              //   textFieldAlignment: MainAxisAlignment.spaceAround,
              //   fieldStyle: FieldStyle.underline,
              //   // onCompleted: () {
              //   //   print("Completed: " );
              //   // },
              // ),
            ),
            OutlinedButton(
              style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 231, 196, 43)),
              onPressed: () {
                verifyotp();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BasicInfoPage(
                              number: _numberController,
                            )));
              },
              child: const Text('VERIFY OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
