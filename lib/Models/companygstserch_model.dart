class Company {
  String gstin;
  String companyName;
  String address;
  String district;
  List<String> state;
  String pinCode;
  String industryType;
  String adminMobile;
  String adminEmail;
  String pan;
  String cin;
  String tan;

  Company({
    required this.gstin,
    required this.companyName,
    required this.address,
    required this.district,
    required this.state,
    required this.pinCode,
    required this.industryType,
    required this.adminMobile,
    required this.adminEmail,
    required this.pan,
    required this.cin,
    required this.tan,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        gstin: json["gstin"],
        companyName: json["companyName"],
        address: json["address"],
        district: json["district"],
        state: List<String>.from(json["state"].map((x) => x)),
        pinCode: json["pinCode"],
        industryType: json["industry_type"],
        adminMobile: json["admin_mobile"],
        adminEmail: json["admin_email"],
        pan: json["pan"],
        cin: json["cin"],
        tan: json["tan"],
      );
  Map<String, dynamic> toJson() => {
        "gstin": gstin,
        "companyName": companyName,
        "address": address,
        "district": district,
        "state": List<dynamic>.from(state.map((x) => x)),
        "pinCode": pinCode,
        "industry_type": industryType,
        "admin_mobile": adminMobile,
        "admin_email": adminEmail,
        "pan": pan,
        "cin": cin,
        "tan": tan,
      };
}
