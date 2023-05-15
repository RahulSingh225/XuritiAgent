// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupeii_app/Models/userdetails_model.dart';
import 'package:groupeii_app/services/dio_service.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:groupeii_app/ui/addgstinfo_page.dart';
import '../Models/companygstserch_model.dart';
import 'package:groupeii_app/ui/basicinfo_page.dart';
import 'package:groupeii_app/ui/dash_board.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/serice_locator.dart';

class GstSearchPage extends StatefulWidget {
  final TextEditingController? firstname;
  final TextEditingController? lastname;
  final TextEditingController? retaileremail;
  final TextEditingController? retailerphone;
  // final Company? company;
  const GstSearchPage({
    super.key,
    this.firstname,
    this.lastname,
    this.retaileremail,
    this.retailerphone,
  });
  @override
  State<GstSearchPage> createState() => _GstSearchPageState();
}

class _GstSearchPageState extends State<GstSearchPage> {
  var company2;
  // String? panNo = Company company?.gstin.substring(2, 12);
  // get companypan => company?.gstin.substring(2,12);
  // get companyname => company?.companyName;
  String? token = getIt<SharedPreferences>().getString("token");

  String? userID = getIt<SharedPreferences>().getString("_id");

  String GST = "";

  final TextEditingController _GSTController = TextEditingController();

  Map<String, dynamic>? gstData = {};

  get status => null;

  // get companypan => "";
  // get companyname => "";
  Future<Map<String, dynamic>?> checkGST() async {
    // String url = "/entity/v2/search-gst";
    String url = "/entity/search-gst";

    Map<String, dynamic> data = {
      "gstin": _GSTController.text,
    };
    // String? token = await getIt<SharedPreferences>().getString("token");
    print(data);
    Map<String, dynamic>? responseData =
        await getIt<DioClient>().post(url, data, token);

    try { 
      if (responseData != null) {
        dynamic company_gstin = responseData['company'];
        print(company_gstin);
        Company company = Company.fromJson(company_gstin);
        company2 = company;
        // print(company2);
        // String panNo = company.gstin.substring(2, 12);

        if (company != null) {
          var companyname = company.companyName;
          var companypan = company.gstin.substring(2, 12);
          print(companyname);
          print(company.gstin);
          print(companypan);
        } else {
          print('Error parsing company data.');
        }
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
    String url = "/entity/add-entity";
    print(company2?.gstin);
    // String? token = await getIt<SharedPreferences>().getString("token");

    Map<String, dynamic> data = {
      "pan": company2.gstin.substring(2, 12),
      "recaptcha": "test_recaptcha",
      "consent_gst_defaultFlag": "true",
      "gstin": _GSTController.text,
      "userID": userID,
      "admin_mobile": widget.retailerphone!.text,
      "admin_email": widget.retaileremail!.text,
      "companyName": "hjsdb",
    };
    var op = company2.toString();
    print("$data['pan'],aaaaaaaaaaa,$op");
    Map<String, dynamic>? responseData =
        await getIt<DioClient>().post(url, data, token);

    print(responseData);

    try {
      if (responseData != null) {
        // final prefs = await SharedPreferences.getInstance();
        //  var jsonData = json.decode(responseData[0]?.value);

        // print(address);
        // print(GST);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashBoard()));
        print(responseData);
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
            onPressed: () async {
              await checkGST();
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
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const DashBoard()));
            },
            child: const Text('Add commpany'),
          ),
        ],
      )),
    );
  }
}
