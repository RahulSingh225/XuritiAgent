// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:groupeii_app/ui/addgstinfo_page.dart';
import 'package:groupeii_app/ui/basicinfo_page.dart';

class GstSearchPage extends StatefulWidget {
  const GstSearchPage({super.key});

  @override
  State<GstSearchPage> createState() => _GstSearchPageState();
}

class _GstSearchPageState extends State<GstSearchPage> {
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
                            builder: (context) => const BasicInfoPage()));
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                labelText: 'GST Number',
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
          ),
          OutlinedButton(
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 231, 196, 43)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddGstInfopage()));
            },
            child: const Text('GST Details'),
          ),
        ],
      )),
    );
  }
}
