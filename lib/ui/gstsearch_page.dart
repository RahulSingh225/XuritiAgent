// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:groupeii_app/Models/AddGST.dart';
import 'package:groupeii_app/helper/serice_locator.dart';
import 'package:groupeii_app/services/dio_service.dart';
import 'package:groupeii_app/ui/addgstinfo_page.dart';
import 'package:groupeii_app/ui/basicinfo_page.dart';
import 'package:groupeii_app/ui/dash_board.dart';


class GstSearchPage extends StatefulWidget {
  const GstSearchPage({super.key});

  @override
  State<GstSearchPage> createState() => _GstSearchPageState();
}

class _GstSearchPageState extends State<GstSearchPage> {
  String GST="";
  final TextEditingController _GSTController = TextEditingController();
  Company? addGST;
  Map<String, dynamic>? gstData = {};
  Future<Company?> checkGST() async {
    String url = "/entity/v2/search-gst";
    
    Map<String, dynamic> data = {
      "gstin":_GSTController.text,
      
      
      "recaptcha": "test_recaptcha"
    };
    // String? token = await getIt<SharedPreferences>().getString("token");

    Map<String, dynamic>? responseData = await getIt<DioClient>().post(
        url,
        data,
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpdiI6IjBmYTgzZmU1YTk4ODY3YzE2NmQwY2FmYTBiNDI0MGU4IiwiY29udGVudCI6IjNiOThhMjc0N2FhZjI2OWVkZTE4NmJhODNjMDlhNjQ2OTQ5YTVkNTM5ZmVmNGRkMjE5ZGY0ZTY3YzhjM2IzZjM5MWQwM2NkMmMwMDA0OTkxNGY3NWQ2NWRiNTliODk1NTc5MjAyYzg1ZDQyZGEwNWZkZmM5ZDU0NDljZGU1ZjM2ODNhYzYwNmJkOGM4MzVmNGJjYjc2ZmFiNTdkNTFiIiwiaWF0IjoxNjgzMTAwNzU1LCJleHAiOjE2ODMxMjk1NTV9.ln1PILrstjyTuUo7z-PD8AsVASNos6l8Mo7XUOya5G54FxEbxzncMsq0gdx8e0l6LsTWjylTsmMHEXUYjl_lsEexCprdHFOYy45Wx9Rb2dY6V52ngHsOsHCqg_JUz7oNWU8Jx_jeygjj8K-NNncvktckKq6VzVZ4-Yt3xNZ73Rv0xhqakyeRQM7hOSUVAKv1cxMJpYA81ynoDMr-yNxliiKhIqNuRUf0DN3WU4dyYiLQDfri33hd36Qp9B0EEiOwr4N9a-vjdAXyGP8P2yvcwiAYSlnnrlEkDcccEpmsdIaU_qUYrKVzzMEwHxwlqyIulTBBK5JegbExHJowP6LBKPrteF_SB6AGUyir4ljKn_rFv4_Tx4-AOyFQr4YZQ3CsNbMYBSsJgCK073VEiAVJEip0mSf2KYshxsA_K5rbY03QlTLtMZxB0TvwBtY0JuI225olxHRgVlAJ46MI2UxsjwrPsDC69dSwaLVqkkupsucKFC9HXXupyOSj9PTVKPGu.ERozGEQnX2Y3Wi4Ipgw4XTQz4oFnqvqHJ1vshEi-4rohnUX4S46GHVl7crSVVTiAANCoa-KaNrBeYT1XQNPyyt_kvNzxMKB5_cn3ag4sk8vSyon3p83OiQ57wYF2ZZsloFEo1OPv5Y2cCumsCgWP9sz2SR-yyrDdfRtG-sZVtbub7KgFyKo5bHfiGEB9tchJTTDS43peA0GVfjcVu6CluIfaPjGrhpTeIt6UU9wZTdur9Jn1tEQzH0hjT7e84o1uxMbkOHC4XAB9mh54lvme5zm2cvQ67vO0cGnGVevByvXJwXsrQsi34oSDMW_STz_V5ujmRzuDkHU-7qD1n2wEmqSlzFFHFESODkHUaso_RgGr0_6QHebvzTaZnPm4jM1GBAB23gCKvv9B2LCHTy_hcO0GTBD-mgyyTNB0RAwbN7dPxp8OVOdV-UQLt3Y3Af6gSplTjDVOxTGcR3t_yow0nXc1k_JM6GShXQr9go8_u7bpGAvP0BuTz8NPAwUmKygu");

    try {
      if (responseData!['status'] == false) {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const DashBoard()));
        //print(responseData);
     addGST = Company.fromJson(responseData);
     
     
      } 
    } catch (e) {
      print(e);
    }

    return addGST;
  }
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add GST Number"),
      ),
      
    body: Column(
      children: [
        InkWell(
            onTap: () {
            FocusScope.of(context).unfocus();
            },
            // row and column
            child: Center(
            child: Container(
                margin: EdgeInsets.only(
                left: w / 35,
                right: w / 35,
                ),
             child: TextFormField(
               controller: _GSTController,
               
               
             ),
            ),
            ),
        ),
         OutlinedButton(
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 231, 196, 43)),
            onPressed: () {
              checkGST();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const AddGstInfopage()));
            },
            child: const Text("GST Details")
          ),
      ],
    ),
    );
}
}
//           Padding(
//             padding: const EdgeInsets.all(40.0),
//             child: TextFormField(
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red)),
//                 labelText: 'GST Number',
//                 prefixIcon: Icon(Icons.numbers),
//               ),
//             ),
//           ),
         
        
      
    
//   }
// }
