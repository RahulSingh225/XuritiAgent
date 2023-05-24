// ignore_for_file: prefer_const_constructors

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:groupeii_app/ui/kycscreens/kycdash.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:groupeii_app/routes/routes.dart' as route;


import 'dart:io';

class Bankstatement extends StatefulWidget {
  const Bankstatement({super.key});

  @override
  State<Bankstatement> createState() => _BankstatementState();
}

class _BankstatementState extends State<Bankstatement> {
  List<PDFDocument> pdfDocuments = [];
  List<PlatformFile>? pickedFiles;

  Future<void> pickImagesFromGallery() async {
    List<FilePickerResult> resultList = [];

    try {
      resultList = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true,
      )) as List<FilePickerResult>;

      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  //   try {
  //     final result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['pdf'],
  //       allowMultiple: true,
  //     );

  //     // if (result != null) {
  //     //   setState(() {
  //     //     pickedFiles = result.files;
  //     //      loadPDFDocuments();
  //     //   });
  //     // }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // Future<void> loadPDFDocuments() async {
  //   pdfDocuments.clear();
  //   if (pickedFiles != null) {
  //     for (final file in pickedFiles!) {
  //       final pdfBytes = file.bytes;

  //       final pdfDocument = await PDFDocument.fromBytes(bytes);
  //       setState(() {
  //         pdfDocuments.add(pdfDocument);
  //       });
  //     }
  //   }
  // }

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
                            builder: (context) => const kycdash()));
                  },
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Here will be company name",
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bank Statement Upload",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      //  TextStyle(color: Colors.black.withOpacity(0.6)),
                      Text(" Please wait for 24-48 to get approved "),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 900.0,
                  height: 60.0,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150.0,
                        height: 50.0,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.grey,
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.amber, width: 1.5),
                          ),
                          icon: Icon(Icons.picture_as_pdf_outlined),
                          label: Text(
                            'PICK PDF',
                          ),
                          onPressed: () {
                            print('Pressed');
                            //  getImage(ImageSource.gallery);
                            pickImagesFromGallery();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Gstupload()));
                          },
                        ),
                      ),
                      Container(
                        width: 150.0,
                        height: 50.0,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black54,
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.amber, width: 1.5),
                          ),
                          icon: Icon(Icons.arrow_drop_up_outlined),
                          label: Text(
                            'SUBMIT',
                          ),
                          onPressed: () {
                            // getImage(ImageSource.camera);
                            print('Pressed');

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Gstupload()));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            height: 10,
            thickness: 0.5,
            indent: 20,
            endIndent: 15,
            color: Colors.black,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Files",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      //  TextStyle(color: Colors.black.withOpacity(0.6)),
                      Text("No files uploaded "),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 10,
                thickness: 0.5,
                indent: 20,
                endIndent: 15,
                color: Colors.amber,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 350,
                          width: 350,
                          child: pdfDocuments.isNotEmpty
                              ? GridView.builder(
                                  itemCount: pdfDocuments.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        3, // Set the number of columns in the grid
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return PDFViewer(
                                      document: pdfDocuments[index],
                                    );
                                  },
                                )
                              : Image.asset("assests/Notes1.png"),
                        ),

                        
                      ],
                    ),

                    

                    // Image.file(
                    //     _image!,
                    //     width: 250,
                    //     height: 50,
                    //     fit: BoxFit.cover,
                    //   )
                  ],
                ),
              ),
              

              
            ],
          )
        ],
      )),
    );
  }
}
