//import 'package:flutter/cupertino.dart';
// import 'dart:ui';

import 'package:flutter/gestures.dart';

// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
// import 'package:groupeii_app/Models/userdetails_model.dart';
import 'package:groupeii_app/helper/serice_locator.dart';
// import 'package:groupeii_app/pages/auth/register_page.dart';
import 'package:groupeii_app/services/dio_service.dart';
import 'package:groupeii_app/ui/dash_board.dart';
import 'package:groupeii_app/widget/widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<Map<String, dynamic>?> _signwithuser() async {
    String url = "/auth/user-login";

    Map<String, dynamic> data = {
      "email": _emailController.text,
      "password": _passwordController.text,
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashBoard()));
        //print(responseData);
      }
    } catch (e) {
      print(e);
    }

    return responseData;
  }

  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "AGENT ONBOARDING",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Agent Applicaion",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset("assests/Onboarding-amico.png"),
                  TextFormField(
                    controller: _emailController,
                    decoration: textInputDecoration.copyWith(
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Theme.of(context).primaryColor,
                        )),
                    onChanged: (e) {
                      setState(() {
                        email = e;
                        // print(email);
                      });
                    },
                    // validator: (e) {
                    //   return RegExp(
                    //               // ignore: valid_regexps
                    //               "/^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*")
                    //           .hasMatch(e!)
                    //       ? null
                    //       : "Please enter a valide email";
                    // },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Theme.of(context).primaryColor,
                        )),
                    validator: (pass) {
                      if (pass!.length < 8) {
                        return "Password must be 8 charecters";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (pass) {
                      setState(() {
                        password = pass;
                        // print(pass);
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: (() {
                          _signwithuser();
                        }),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                    text: "Dont have an account?  ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register here',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            // nextscreen(context, const ());
                          }),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ));
  }

  login() {
    if (formKey.currentState!.validate()) {}
  }
}
