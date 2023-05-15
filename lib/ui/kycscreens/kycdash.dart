import 'package:flutter/material.dart';
import 'package:groupeii_app/ui/kycscreens/gstupload.dart';
import 'package:groupeii_app/ui/kycscreens/selectcompany.dart';

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
                            builder: (context) => const selectCompany()));
                  },
                ),
              ),
              SizedBox(
                width: 20,
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
              height: 200,
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
                    const ListTile(
                      leading: Icon(Icons.business_center_outlined, size: 40),
                      title: Text('Company Name',
                          style: TextStyle(fontSize: 20.0)),
                      subtitle: Text(
                          'Addres having new plots for sale as the address has still not have been update as the did not tally the goverment books',
                          style: TextStyle(fontSize: 15.0)),
                    ),
                    SizedBox(
                      height: 20,
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
            child: const Divider(
              height: 10,
              thickness: 0.5,
              indent: 20,
              endIndent: 15,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: (0)),
            child: Container(
              width: 400,
              height: MediaQuery.of(context).size.height / 1.50,
              padding: new EdgeInsets.all(5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.amber.shade100,
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
                            Text("Gst Doumentation"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.done),
                                Text("Successful"),
                              ],
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                  primary: Colors.grey),
                              icon: Icon(Icons.upload_file_outlined),
                              label: Text(
                                'Start',
                              ),
                              onPressed: () {
                                print('Pressed');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Gstupload()));
                              },
                            )
                          ],
                        ),
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
  }
}
