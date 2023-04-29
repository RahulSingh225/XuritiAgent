// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:groupeii_app/ui/addmobile_page.dart';
import 'package:groupeii_app/ui/gstsearch_page.dart';

class BasicInfoPage extends StatefulWidget {
  const BasicInfoPage({super.key});

  @override
  State<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Enter retailers store name',
                    prefixIcon: Icon(Icons.store),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                child: TextFormField(
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: 'Enter retailers area',
                    prefixIcon: Icon(Icons.area_chart),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GstSearchPage()));
                },
                child: const Text('SUBMIT & PROCEED'),
              ),

              //  Text("Please Entre the OTP")
            ],
          ),
        ],
      )),
    );
  }
}
