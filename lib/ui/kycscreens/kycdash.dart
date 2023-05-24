// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:groupeii_app/ui/dash_board.dart';
import 'package:groupeii_app/ui/kycscreens/aadhaarupload.dart';
import 'package:groupeii_app/ui/kycscreens/bankstatment.dart';
import 'package:groupeii_app/ui/kycscreens/businessproof.dart';
import 'package:groupeii_app/ui/kycscreens/chequesupload.dart';
import 'package:groupeii_app/ui/kycscreens/facematch.dart';
import 'package:groupeii_app/ui/kycscreens/gstupload.dart';
import 'package:groupeii_app/ui/kycscreens/panupload.dart';
import 'package:groupeii_app/ui/kycscreens/selectcompany.dart';
import 'package:groupeii_app/ui/kycscreens/storeimage.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:groupeii_app/routes/routes.dart' as route;

class kycdash extends StatefulWidget {
  const kycdash({super.key});

  @override
  State<kycdash> createState() => _kycdashState();
}

class _kycdashState extends State<kycdash> {
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
                height: MediaQuery.of(context).size.height / 10,
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
                            builder: (context) => const selectCompany()));
                  },
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Text(
                "KYC HOMEPAGE",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: (0)),
            child: Container(
              width: 400,
              height: MediaQuery.of(context).size.height / 4.3,
              padding: new EdgeInsets.all(5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.amber.shade200,
                elevation: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: const ListTile(
                        leading: Icon(Icons.add_business_outlined, size: 40),
                        title: Text('Company Name',
                            style: TextStyle(fontSize: 20.0)),
                        subtitle: Text(
                            'Addres having new plots for sale as the address has still not have been update as the did not tally the goverment books',
                            style: TextStyle(fontSize: 15.0)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70, top: 30),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("GST NO")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 30),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(": XXXXXXXXXXXX")),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StyledDivider(
              color: Colors.amber,
              height: 10,
              thickness: 1.5,
              lineStyle: DividerLineStyle.dotted,
              indent: 5,
              endIndent: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: (0)),
            child: Container(
              width: 450,
              height: MediaQuery.of(context).size.height / 1.2,
              padding: new EdgeInsets.all(5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                width: 113, child: Text("GST Documentation")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.pushNamed(context, route.gstupload );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                width: 113, child: Text("Aadhaar Upload")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Aadhaar()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(width: 113, child: Text("Pan Upload")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PanUpload()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(width: 113, child: Text("Face Match")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FacematchUpload()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                width: 113, child: Text("Bank statement")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Bankstatement()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(width: 113, child: Text("Cheque Upload")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChequeUpload()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                width: 113, child: Text("Business Proof")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BusinessProof()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const StyledDivider(
                      color: Colors.amber,
                      height: 10,
                      thickness: 1.5,
                      lineStyle: DividerLineStyle.dotted,
                      indent: 5,
                      endIndent: 10,
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(width: 113, child: Text("Store Images")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.error_outline_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Pending"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                side:
                                    BorderSide(color: Colors.amber, width: 1.5),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              ),
                              label: Text(
                                'START',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StoreimageUpload()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.grey,
                        side: BorderSide(color: Colors.amber, width: 1.5),
                      ),
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                      ),
                      label: Text(
                        'PROCEED',
                      ),
                      onPressed: () {
                        print('Pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
