// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:groupeii_app/ui/addgstinfo_page.dart';
import 'package:groupeii_app/ui/basicinfo_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/companygstserch_model.dart';
import '../helper/serice_locator.dart';
import '../services/dio_service.dart';

class GstSearchPage extends StatefulWidget {
  final TextEditingController? firstname;
  final TextEditingController? lastname;
  final TextEditingController? retaileremail;
  final TextEditingController? retailerphone;

  const GstSearchPage({
    super.key,
    this.firstname,
    this.lastname,
    this.retaileremail,
    this.retailerphone,
    required TextEditingController retailercontact,
  });

  @override
  State<GstSearchPage> createState() => _GstSearchPageState();
}

class _GstSearchPageState extends State<GstSearchPage> {
  late final Company? company;
  String GST = "";
  final TextEditingController _GSTController = TextEditingController();

  Map<String, dynamic>? gstData = {};
  Future<Map<String, dynamic>?> checkGST() async {
    // String url = "/entity/v2/search-gst";
    String url = "/entity/search-gst";

    Map<String, dynamic> data = {
      "gstin": company?.gstin,
    };
    // String? token = await getIt<SharedPreferences>().getString("token");

    Map<String, dynamic>? responseData = await getIt<DioClient>().post(
        url,
        data,
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdiI6IjBmYTgzZmU1YTk4ODY3YzE2NmQwY2FmYTBiNDI0MGU4IiwiY29udGVudCI6IjNiOThhMjc0N2FhZjI2OWVkZTE4NmJhODNjMDlhNjQ2OTQ5YTVkNTM5ZmVmNGRkMjE5ZGY0ZTY3YzhjM2IzZjM5MWQwM2NkMmMwMDA0OTkxNGY3NWQ2NWRiNTliODk1NTc5MjAyYzg1ZDQyZGEwNWZkZmM5ZDU0NDljZGU1ZjM2ODNhYzYwNmJkOGM4MzVmNGJjYjc2ZmFiNTdkNTFiIiwiaWF0IjoxNjgzMTAwNzU1LCJleHAiOjE2ODMxMjk1NTV9.ln1PILrstjyTuUo7z-PD8AsVASNos6l8Mo7XUOya5G54FxEbxzncMsq0gdx8e0l6LsTWjylTsmMHEXUYjl_lsEexCprdHFOYy45Wx9Rb2dY6V52ngHsOsHCqg_JUz7oNWU8Jx_jeygjj8K-NNncvktckKq6VzVZ4-Yt3xNZ73Rv0xhqakyeRQM7hOSUVAKv1cxMJpYA81ynoDMr-yNxliiKhIqNuRUf0DN3WU4dyYiLQDfri33hd36Qp9B0EEiOwr4N9a-vjdAXyGP8P2yvcwiAYSlnnrlEkDcccEpmsdIaU_qUYrKVzzMEwHxwlqyIulTBBK5JegbExHJowP6LBKPrteF_SB6AGUyir4ljKn_rFv4_Tx4-AOyFQr4YZQ3CsNbMYBSsJgCK073VEiAVJEip0mSf2KYshxsA_K5rbY03QlTLtMZxB0TvwBtY0JuI225olxHRgVlAJ46MI2UxsjwrPsDC69dSwaLVqkkupsucKFC9HXXupyOSj9PTVKPGu.ERozGEQnX2Y3Wi4Ipgw4XTQz4oFnqvqHJ1vshEi-4rohnUX4S46GHVl7crSVVTiAANCoa-KaNrBeYT1XQNPyyt_kvNzxMKB5_cn3ag4sk8vSyon3p83OiQ57wYF2ZZsloFEo1OPv5Y2cCumsCgWP9sz2SR-yyrDdfRtG-sZVtbub7KgFyKo5bHfiGEB9tchJTTDS43peA0GVfjcVu6CluIfaPjGrhpTeIt6UU9wZTdur9Jn1tEQzH0hjT7e84o1uxMbkOHC4XAB9mh54lvme5zm2cvQ67vO0cGnGVevByvXJwXsrQsi34oSDMW_STz_V5ujmRzuDkHU-7qD1n2wEmqSlzFFHFESODkHUaso_RgGr0_6QHebvzTaZnPm4jM1GBAB23gCKvv9B2LCHTy_hcO0GTBD-mgyyTNB0RAwbN7dPxp8OVOdV-UQLt3Y3Af6gSplTjDVOxTGcR3t_yow0nXc1k_JM6GShXQr9go8_u7bpGAvP0BuTz8NPAwUmKygu");

    try {
      if (responseData != null) {
        var company_gstin = responseData['company'];
        Company company = Company.fromJson(company_gstin);

        if (company != null) {
          print('Company data successfully parsed and stored in model.');
        } else {
          print('Error parsing company data.');
        }
        // final prefs = await SharedPreferences.getInstance();
        //  var jsonData = json.decode(responseData[0]?.value);

        // print(address);
        // print(GST);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const DashBoard()));
        //print(responseData);
        //  addGST = Company.fromJson(responseData);

      }
    } catch (e) {
      print(e);
    }
    return responseData;
    // return addGST;
  }

  //  Map<String, dynamic>? gstData = {};
  Future<Map<String, dynamic>?> addcompany() async {
    // String url = "/entity/v2/search-gst";
    String url = "/entity/add-entityt";

    // String? token = await getIt<SharedPreferences>().getString("token");
    Map<String, dynamic> data = {
      "gstin": company?.gstin,
      "admin_email": widget.retaileremail,
      "admin_mobile": widget.retailerphone,
      "pan": company?.gstin.substring(2, 12),
      "consent_gst_defaultFlag": "true",
      "companyName": company?.companyName,
      "userId": "skjnnsfmsmsfsf",
      "recaptcha": "test_recaptcha"
      "userID"  "63ac087916c0369739bb3963",
    };

    Map<String, dynamic>? responseData = await getIt<DioClient>().post(
        url,
        data,
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdiI6IjBmYTgzZmU1YTk4ODY3YzE2NmQwY2FmYTBiNDI0MGU4IiwiY29udGVudCI6IjNiOThhMjc0N2FhZjI2OWVkZTE4NmJhODNjMDlhNjQ2OTQ5YTVkNTM5ZmVmNGRkMjE5ZGY0ZTY3YzhjM2IzZjM5MWQwM2NkMmMwMDA0OTkxNGY3NWQ2NWRiNTliODk1NTc5MjAyYzg1ZDQyZGEwNWZkZmM5ZDU0NDljZGU1ZjM2ODNhYzYwNmJkOGM4MzVmNGJjYjc2ZmFiNTdkNTFiIiwiaWF0IjoxNjgzMTAwNzU1LCJleHAiOjE2ODMxMjk1NTV9.ln1PILrstjyTuUo7z-PD8AsVASNos6l8Mo7XUOya5G54FxEbxzncMsq0gdx8e0l6LsTWjylTsmMHEXUYjl_lsEexCprdHFOYy45Wx9Rb2dY6V52ngHsOsHCqg_JUz7oNWU8Jx_jeygjj8K-NNncvktckKq6VzVZ4-Yt3xNZ73Rv0xhqakyeRQM7hOSUVAKv1cxMJpYA81ynoDMr-yNxliiKhIqNuRUf0DN3WU4dyYiLQDfri33hd36Qp9B0EEiOwr4N9a-vjdAXyGP8P2yvcwiAYSlnnrlEkDcccEpmsdIaU_qUYrKVzzMEwHxwlqyIulTBBK5JegbExHJowP6LBKPrteF_SB6AGUyir4ljKn_rFv4_Tx4-AOyFQr4YZQ3CsNbMYBSsJgCK073VEiAVJEip0mSf2KYshxsA_K5rbY03QlTLtMZxB0TvwBtY0JuI225olxHRgVlAJ46MI2UxsjwrPsDC69dSwaLVqkkupsucKFC9HXXupyOSj9PTVKPGu.ERozGEQnX2Y3Wi4Ipgw4XTQz4oFnqvqHJ1vshEi-4rohnUX4S46GHVl7crSVVTiAANCoa-KaNrBeYT1XQNPyyt_kvNzxMKB5_cn3ag4sk8vSyon3p83OiQ57wYF2ZZsloFEo1OPv5Y2cCumsCgWP9sz2SR-yyrDdfRtG-sZVtbub7KgFyKo5bHfiGEB9tchJTTDS43peA0GVfjcVu6CluIfaPjGrhpTeIt6UU9wZTdur9Jn1tEQzH0hjT7e84o1uxMbkOHC4XAB9mh54lvme5zm2cvQ67vO0cGnGVevByvXJwXsrQsi34oSDMW_STz_V5ujmRzuDkHU-7qD1n2wEmqSlzFFHFESODkHUaso_RgGr0_6QHebvzTaZnPm4jM1GBAB23gCKvv9B2LCHTy_hcO0GTBD-mgyyTNB0RAwbN7dPxp8OVOdV-UQLt3Y3Af6gSplTjDVOxTGcR3t_yow0nXc1k_JM6GShXQr9go8_u7bpGAvP0BuTz8NPAwUmKygu");

    try {
      if (responseData != null) {
        print(responseData);
        // final prefs = await SharedPreferences.getInstance();
        //  var jsonData = json.decode(responseData[0]?.value);

        // print(address);
        // print(GST);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const DashBoard()));
        //print(responseData);
        //  addGST = Company.fromJson(responseData);

      }
    } catch (e) {
      print(e);
    }
    return responseData;
    // return addGST;
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
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BasicInfoPage()));
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("Add GST information"),
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
                        "GST Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20),
                      ),

                      SizedBox(
                        height: 6,
                      ),
                      //  TextStyle(color: Colors.black.withOpacity(0.6)),
                      Text("Provide retailers Gst number"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextFormField(
              controller: _GSTController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                labelText: 'GST Number',
                prefixIcon: Icon(Icons.search_off_outlined),
              ),
            ),
          ),
          OutlinedButton(
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 231, 196, 43)),
            onPressed: () {
              checkGST();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const AddGstInfopage()));
            },
            child: const Text('GST Details'),
          ),
          OutlinedButton(
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 231, 196, 43)),
            onPressed: () {
              addcompany();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const AddGstInfopage()));
            },
            child: const Text('Add commpany'),
          ),
        ],
      )),
    );
  }
}
