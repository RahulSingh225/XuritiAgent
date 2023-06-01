import 'dart:io';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:groupeii_app/helper/serice_locator.dart';
import 'package:groupeii_app/services/dio_service.dart';
import 'package:groupeii_app/ui/kycscreens/kycdash.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:groupeii_app/routes/routes.dart' as route;
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Gstupload extends StatefulWidget {
  const Gstupload({super.key});

  @override
  State<Gstupload> createState() => _GstuploadState();
}

class _GstuploadState extends State<Gstupload> {
  List<XFile>? selectedImages = [];
  // Dio dio = Dio();

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

  // Future uploadFile({required File? file}) async {
  //   if (file == null) {
  //     Map<String, dynamic> errorMessage = {
  //       'msg': 'File upload failed',
  //       'status': false
  //     };
  //     return errorMessage;
  //   } else {
  //     //final fileName = basename(file.path);
  //     //final destination = 'files/$fileName';
  //   }
  // }

  Future<void> uploadImages() async {
    try {
      for (var image in selectedImages!) {
        String fileName = image.path.split('/').last;
        String? token = getIt<SharedPreferences>().getString("token");
        dynamic companyId = getIt<SharedPreferences>().getString('companyId');
        String? userID = getIt<SharedPreferences>().getString("_id");

        FormData formData = FormData.fromMap({
          'userID': userID,
          'companyId': '62e50442ca850b8f8feb9453',
          'GstDetails': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
            contentType: MediaType(
                'GstDetails', 'jpeg'), // Adjust the content type if necessary
          ),
        });

        // Adjust the API endpoint URL and parameters as per your requirement

        //   Response response = await dio
        //       .post('https://uat.xuriti.app/api/entity/onboard', data: formData);

        //   // Handle the response as needed
        //   print('Image uploaded: $fileName');
        //   print('Response hello: ${response.data}');
        //  }

        Response response;
        await getIt<DioClient>()
            .postFormData('/entity/onboard', formData, token);
        print('Image uploaded: $fileName');

        // print({response.data});
      } //???  ///////////$responseData');

    } catch (error) {
      // Handle any errors that occur during the upload
      print('Error uploading images: $error');
    }
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
                    selectedImages != null
                        ? OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black54,
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.amber, width: 1.5),
                            ),
                            icon: Icon(Icons.arrow_drop_up_outlined),
                            label: Text(
                              'KKKK',
                            ),
                            onPressed: () {
                              uploadImages();
                              // getImage(ImageSource.camera);

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Gstupload()));
                            },
                          )
                        : OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black54,
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.amber, width: 1.5),
                            ),
                            icon: Icon(Icons.arrow_drop_up_outlined),
                            label: Text(
                              'hello',
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
