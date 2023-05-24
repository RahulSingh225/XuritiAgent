// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:groupeii_app/Models/companygstserch_model.dart';
import 'package:groupeii_app/Models/get_company_list.dart';
import 'package:groupeii_app/helper/serice_locator.dart';
import 'package:groupeii_app/services/dio_service.dart';
import 'package:groupeii_app/ui/dash_board.dart';
import 'package:groupeii_app/ui/kycscreens/kycdash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:groupeii_app/routes/routes.dart' as route;

class selectCompany extends StatefulWidget {
  const selectCompany({super.key});

  @override
  State<selectCompany> createState() => _selectCompanyState();
}

class _selectCompanyState extends State<selectCompany> {
  Future<Map<String, dynamic>?> selectCompany() async {
    String url = "/entity/entities";
    String? token = getIt<SharedPreferences>().getString("token");

    Map<String, dynamic>? responseData =
        await getIt<DioClient>().get(url, token);
    // print("tokeeeeeen $token");
    // print(responseData);
    // print(responseData?['companies']);
    dynamic getsellerlist = responseData![1]['company'];
    print(getsellerlist);
    CompanyDetails companylist = CompanyDetails.fromJson(getsellerlist);

    if (responseData![0]['status'] == true) {
      dynamic getsellerlist = responseData['company'];
      CompanyDetails companylist = CompanyDetails.fromJson(getsellerlist);

      // print('comappannyyyy$companylist');
    } else {}
  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  String? token = getIt<SharedPreferences>().getString("token");
  String endUrl = "/entity/entities";

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
                              builder: (context) => const DashBoard()));
                    },
                  ),
                ),
                SizedBox(
                  width: 05,
                ),
                Text("Select Retailer"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Select Retailer',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      var selectedValue = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 400,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(05),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 0,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.grey,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    width: 400,
                    padding: null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    elevation: 0,
                    offset: const Offset(-0, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(10),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 400,
                height: 200,
                padding: new EdgeInsets.all(5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.yellow.shade500,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.business_center_outlined, size: 40),
                        title: Text('Company Name',
                            style: TextStyle(fontSize: 20.0)),
                        subtitle: Text(
                            'Addres having new plots for sale as the address has still not have been update as the did not tally the goverment books',
                            style: TextStyle(fontSize: 18.0)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("GST NO")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
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
              padding: EdgeInsets.only(left: 45),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Please enter first name of the Retailer")),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                maxLength: 128,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  labelText: 'Enter Retailers first name',
                  prefixIcon: Icon(Icons.keyboard_alt_outlined),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Please enter last name of the Retailer")),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                maxLength: 128,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  labelText: 'Enter Retailers last name',
                  prefixIcon: Icon(Icons.keyboard_alt_outlined),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Select Retailer',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      var selectedValue = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 400,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(05),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 0,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.grey,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 100,
                    width: 400,
                    padding: null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    elevation: 5,
                    offset: const Offset(-10, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(10),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 231, 196, 43)),
              onPressed: () {
                // selectCompany();
                Navigator.pushNamed(context, route.kycdashboard);
                debugPrint('Received click');
                // sendotp();
              },
              child: const Text('PROCEED'),
            ),
          ],
        ),
      ),
    );
  }
}
