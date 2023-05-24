import 'package:flutter/material.dart';
import 'package:groupeii_app/pages/auth/login_page.dart';
import 'package:groupeii_app/ui/dash_board.dart';
import 'package:groupeii_app/ui/kycscreens/kycdash.dart';
import 'package:groupeii_app/ui/kycscreens/gstupload.dart';

const String loginPage = "login";
const String kycdashboard = "kycdash";
const String dashboard = "dashboard";
const String aadhaarupload = "aadhaar";
const String bankstatment = "bankstatment";
const String businessProof = "businessproofe";
const String chequeSubmission = "chequeproofe";
const String facematch = "facmatchproofe";
const String gstupload = "gstuploaded";
const String panupload = "panuploaded";
const String selectcompany = " selectcompanys";
const String storeImage = "stroreImages";
const String addgstinfo = "addgsts";
const String addmobile = "addmobileno";
const String basicinfo = "basicinfomation";
const String gstsearch = "gstsearchs";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
      break;
    case kycdashboard:
      return MaterialPageRoute(builder: (context) => kycdash());
      break;
    case dashboard:
      return MaterialPageRoute(builder: (context) => DashBoard());
      break;
       case gstupload:
      return MaterialPageRoute(builder: (context) => Gstupload());
      break;
    default:
      throw ("this route paage is not possiable");
  }
}
