class UserDetails {
  UserData? user;
  String? token;
  // String? status;

  UserDetails(Map<String, dynamic>? responseData, {this.user});

  UserDetails.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    token = json['token'];
    // status= json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserData {
  dynamic sId;
  String? name;
  dynamic email;
  String? password;
  dynamic mobileNumber;
  String? gid;
  String? referralCode;
  String? firstName;
  String? lastName;
  String? userRole;
  String? profilePic;
  String? status;
  bool? active;
  bool? softDelete;
  bool? flag;
  String? createdAt;
  String? updatedAt;
  // int? iV;

  UserData({
    this.sId,
    this.name,
    this.email,
    this.password,
    this.mobileNumber,
    this.gid,
    this.referralCode,
    this.firstName,
    this.lastName,
    this.userRole,
    this.profilePic,
    this.status,
    this.active,
    this.softDelete,
    this.flag,
    this.createdAt,
    this.updatedAt,
    // this.iV
  });

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    mobileNumber = json['mobile_number'];
    gid = json['gid'];
    referralCode = json['referral_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userRole = json['user_role'];
    profilePic = json['profile_pic'];
    status = json['status'];
    active = json['active'];
    softDelete = json['soft_delete'];
    flag = json['flag'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['mobile_number'] = mobileNumber;
    data['gid'] = gid;
    data['referral_code'] = referralCode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['user_role'] = userRole;
    data['profile_pic'] = profilePic;
    data['status'] = status;
    data['active'] = active;
    data['soft_delete'] = softDelete;
    data['flag'] = flag;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    // data['__v'] = this.iV;
    return data;
  }
}



// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

//  Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

//  String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//     String message;
//     bool status;
//     String token;
//     User user;
//     int code;

//     Welcome({
//         required this.message,
//         required this.status,
//         required this.token,
//         required this.user,
//         required this.code,
//     });

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         message: json["message"],
//         status: json["status"],
//         token: json["token"],
//         user: User.fromJson(json["user"]),
//         code: json["code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "status": status,
//         "token": token,
//         "user": user.toJson(),
//         "code": code,
//     };
// }

// class User {
//     String id;
//     String name;
//     String email;
//     String password;
//     String mobileNumber;
//     String gid;
//     String referralCode;
//     String firstName;
//     String lastName;
//     String userRole;
//     String profilePic;
//     String status;
//     bool active;
//     bool softDelete;
//     bool flag;
//     DateTime createdAt;
//     DateTime updatedAt;
//     bool waVerified;
//     int v;
//     DateTime lastLogIn;

//     User({
//         required this.id,
//         required this.name,
//         required this.email,
//         required this.password,
//         required this.mobileNumber,
//         required this.gid,
//         required this.referralCode,
//         required this.firstName,
//         required this.lastName,
//         required this.userRole,
//         required this.profilePic,
//         required this.status,
//         required this.active,
//         required this.softDelete,
//         required this.flag,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.waVerified,
//         required this.v,
//         required this.lastLogIn,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         name: json["name"],
//         email: json["email"],
//         password: json["password"],
//         mobileNumber: json["mobile_number"],
//         gid: json["gid"],
//         referralCode: json["referral_code"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         userRole: json["user_role"],
//         profilePic: json["profile_pic"],
//         status: json["status"],
//         active: json["active"],
//         softDelete: json["soft_delete"],
//         flag: json["flag"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         waVerified: json["waVerified"],
//         v: json["__v"],
//         lastLogIn: DateTime.parse(json["lastLogIn"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "email": email,
//         "password": password,
//         "mobile_number": mobileNumber,
//         "gid": gid,
//         "referral_code": referralCode,
//         "first_name": firstName,
//         "last_name": lastName,
//         "user_role": userRole,
//         "profile_pic": profilePic,
//         "status": status,
//         "active": active,
//         "soft_delete": softDelete,
//         "flag": flag,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "waVerified": waVerified,
//         "__v": v,
//         "lastLogIn": lastLogIn.toIso8601String(),
//     };
// }
