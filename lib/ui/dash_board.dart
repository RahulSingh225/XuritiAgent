import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:groupeii_app/pages/ui/addmobile_page.dart';
import 'package:groupeii_app/ui/addmobile_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key,   });
 

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    // var appBar;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Xuriti Dashboard"),
      // ),
      body: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.(10),
          color: Colors.amber[100],
          shape: BoxShape.rectangle,
        ),
        height: MediaQuery.of(context).size.height / 1.8,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(Icons.person_add_alt_1_outlined,
                            size: 75, color: Color.fromARGB(255, 98, 98, 96)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Add Retailer"),
                      ],
                    ),
                    //  Text("Add Retailer"),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Addmobile()),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(Icons.document_scanner_outlined,
                            size: 75, color: Color.fromARGB(255, 98, 98, 96)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Start KYC")
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.(10),
                  color: Colors.amber[100],
                  shape: BoxShape.rectangle,
                ),
                height: MediaQuery.of(context).size.height / 4.1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.business_center),
                                        tooltip: 'Increase volume by 10',
                                        onPressed: () {
                                          // setState(() {
                                          //   _volume += 10;
                                          // });
                                        },
                                      ),
                                      Text('Business Leads '),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 60),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.add_box),
                                        tooltip: 'Increase volume by 10',
                                        onPressed: () {
                                          // setState(() {
                                          //   _volume += 10;
                                          // });
                                        },
                                      ),
                                      Text('CPV '),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                                shape: BoxShape.rectangle,
                              ),
                              child: Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.leaderboard),
                                    onPressed: () {
                                      // setState(() {
                                      //   _volume += 10;
                                      // });
                                    },
                                  ),
                                  Text('PerSonal Disscussion'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
