import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:groupeii_app/ui/kycscreens/kycdash.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Aadhaar extends StatefulWidget {
  const Aadhaar({super.key});

  @override
  State<Aadhaar> createState() => _AadhaarState();
}

class _AadhaarState extends State<Aadhaar> {
  List<XFile>? selectedImages = [];

  Future<void> pickImagesFromGallery() async {
    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage(
      imageQuality: 80,
      maxWidth: 800,
    );

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        selectedImages!.addAll(pickedFiles);
      });
    }
  }

  Future<void> captureImage() async {
    XFile? capturedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxWidth: 800,
    );

    if (capturedFile != null) {
      setState(() {
        selectedImages!.add(capturedFile);
      });
    }
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
                        "GST Documentation",
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
                          icon: Icon(Icons.upload_file_outlined),
                          label: Text(
                            'Upload',
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
                          icon: Icon(Icons.camera_alt_outlined),
                          label: Text(
                            'Capture',
                          ),
                          onPressed: () {
                            // getImage(ImageSource.camera);
                            print('Pressed');
                            captureImage();

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
                    Container(
                      height: 350,
                      width: 350,
                      child: selectedImages != null
                          ? GridView.builder(
                              itemCount: selectedImages?.length ?? 0,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, // Set the number of columns in the grid
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Image.file(
                                    File(selectedImages![index].path));
                              },
                            )
                          : Image.asset("assests/Notes1.png"),
                    ),

                    // Image.file(
                    //     _image!,
                    //     width: 250,
                    //     height: 50,
                    //     fit: BoxFit.cover,
                    //   )
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
