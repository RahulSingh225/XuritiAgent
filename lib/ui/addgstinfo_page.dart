// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupeii_app/ui/gstsearch_page.dart';

class AddGstInfopage extends StatefulWidget {
  const AddGstInfopage({super.key});

  @override
  State<AddGstInfopage> createState() => _AddGstInfopageState();
}

class _AddGstInfopageState extends State<AddGstInfopage> {
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
                    // Navigator.pop(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const GstSearchPage()));
                  },
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Text("GST Information"),
              SizedBox(
                height: 40,
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(
                          8.0) //                 <--- border radius here
                      ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "07AAGFF2194N1Z1",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Wonka Industries.",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "National Highway 10, Swaran Park, Mundka",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              decorationColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Active",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
    ;
  }
}
