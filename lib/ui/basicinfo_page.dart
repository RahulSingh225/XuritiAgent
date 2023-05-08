// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:groupeii_app/helper/serice_locator.dart';
import 'package:groupeii_app/services/dio_service.dart';
import 'package:groupeii_app/ui/addmobile_page.dart';
import 'package:groupeii_app/ui/dash_board.dart';
import 'package:groupeii_app/ui/gstsearch_page.dart';

class BasicInfoPage extends StatefulWidget {
  const BasicInfoPage({super.key});

  @override
  State<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {
  String firstName="";
  String lastName="";
  String email="";
  String mobile="";
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  

  Future<Map<String, dynamic>?> AddUser() async {
    String url = "/auth/register-user";
    
    Map<String, dynamic> data = {
      "firstName":_firstNameController.text,
      "lastName":_lastNameController .text,
      "email": _emailController.text,
      "mobileNumber":_mobileController.text,
      
      "recaptcha": "test_recaptcha"
    };
    // String? token = await getIt<SharedPreferences>().getString("token");

    Map<String, dynamic>? responseData = await getIt<DioClient>().post(
        url,
        data,
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdiI6IjBmYTgzZmU1YTk4ODY3YzE2NmQwY2FmYTBiNDI0MGU4IiwiY29udGVudCI6IjNiOThhMjc0N2FhZjI2OWVkZTE4NmJhODNjMDlhNjQ2OTQ5YTVkNTM5ZmVmNGRkMjE5ZGY0ZTY3YzhjM2IzZjM5MWQwM2NkMmMwMDA0OTkxNGY3NWQ2NWRiNTliODk1NTc5MjAyYzg1ZDQyZGEwNWZkZmM5ZDU0NDljZGU1ZjM2ODNhYzYwNmJkOGM4MzVmNGJjYjc2ZmFiNTdkNTFiIiwiaWF0IjoxNjgzMTAwNzU1LCJleHAiOjE2ODMxMjk1NTV9.ln1PILrstjyTuUo7z-PD8AsVASNos6l8Mo7XUOya5G54FxEbxzncMsq0gdx8e0l6LsTWjylTsmMHEXUYjl_lsEexCprdHFOYy45Wx9Rb2dY6V52ngHsOsHCqg_JUz7oNWU8Jx_jeygjj8K-NNncvktckKq6VzVZ4-Yt3xNZ73Rv0xhqakyeRQM7hOSUVAKv1cxMJpYA81ynoDMr-yNxliiKhIqNuRUf0DN3WU4dyYiLQDfri33hd36Qp9B0EEiOwr4N9a-vjdAXyGP8P2yvcwiAYSlnnrlEkDcccEpmsdIaU_qUYrKVzzMEwHxwlqyIulTBBK5JegbExHJowP6LBKPrteF_SB6AGUyir4ljKn_rFv4_Tx4-AOyFQr4YZQ3CsNbMYBSsJgCK073VEiAVJEip0mSf2KYshxsA_K5rbY03QlTLtMZxB0TvwBtY0JuI225olxHRgVlAJ46MI2UxsjwrPsDC69dSwaLVqkkupsucKFC9HXXupyOSj9PTVKPGu.ERozGEQnX2Y3Wi4Ipgw4XTQz4oFnqvqHJ1vshEi-4rohnUX4S46GHVl7crSVVTiAANCoa-KaNrBeYT1XQNPyyt_kvNzxMKB5_cn3ag4sk8vSyon3p83OiQ57wYF2ZZsloFEo1OPv5Y2cCumsCgWP9sz2SR-yyrDdfRtG-sZVtbub7KgFyKo5bHfiGEB9tchJTTDS43peA0GVfjcVu6CluIfaPjGrhpTeIt6UU9wZTdur9Jn1tEQzH0hjT7e84o1uxMbkOHC4XAB9mh54lvme5zm2cvQ67vO0cGnGVevByvXJwXsrQsi34oSDMW_STz_V5ujmRzuDkHU-7qD1n2wEmqSlzFFHFESODkHUaso_RgGr0_6QHebvzTaZnPm4jM1GBAB23gCKvv9B2LCHTy_hcO0GTBD-mgyyTNB0RAwbN7dPxp8OVOdV-UQLt3Y3Af6gSplTjDVOxTGcR3t_yow0nXc1k_JM6GShXQr9go8_u7bpGAvP0BuTz8NPAwUmKygu");

    try {
      if (responseData != null) {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const DashBoard()));
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
                            builder: (context) => const Addmobile()));
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("Add  Basic Information"),
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
                        "Basic Information",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20),
                      ),

                      SizedBox(
                        height: 6,
                      ),
                      //  TextStyle(color: Colors.black.withOpacity(0.6)),
                      Text("Please provide basic merchant details "),
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
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
              //   child: TextFormField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.red)),
              //       labelText: 'Enter retailers store name',
              //       prefixIcon: Icon(Icons.store),
              //     ),
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                child: TextFormField(
                  controller: _firstNameController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Enter retailers first name',
                    prefixIcon: Icon(Icons.person_add_alt_1_outlined),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                child: TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Enter retailers last name',
                    prefixIcon: Icon(Icons.person_add_alt_1_outlined),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Enter retailers email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                child: TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Enter retailers mobile number',
                    prefixIcon: Icon(Icons.keyboard_alt_outlined),
                  ),
                ),
              ),

              SizedBox(
                height: 90,
              ),

              OutlinedButton(
                style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 231, 196, 43)),
                onPressed: () {
                  AddUser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GstSearchPage()));
                },
                child: const Text('SUBMIT & PROCEED'),
              ),

              //  Text("Please Enter the OTP")
            ],
          ),
        ],
      )),
    );
  }
}
