

class BasicUserInfo {
  String? name;
  String? email;
  String? password;
  String? mobileNumber;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? waVerified;
  String? id;
  int? v;

  BasicUserInfo({
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
    this.waVerified,
    this.id,
    this.v,
  });

  BasicUserInfo.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    password = json["password"];
    mobileNumber = json["mobile_number"];
    gid = json["gid"];
    referralCode = json["referral_code"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    userRole = json["user_role"];
    profilePic = json["profile_pic"];
    status = json["status"];
    active = json["active"];
    softDelete = json["soft_delete"];
    flag = json["flag"];
    createdAt = DateTime.parse(json["createdAt"]);
    updatedAt = DateTime.parse(json["updatedAt"]);
    waVerified = json["waVerified"];
    id = json["_id"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "mobile_number": mobileNumber,
        "gid": gid,
        "referral_code": referralCode,
        "first_name": firstName,
        "last_name": lastName,
        "user_role": userRole,
        "profile_pic": profilePic,
        "status": status,
        "active": active,
        "soft_delete": softDelete,
        "flag": flag,
        "createdAt": createdAt.toString(),
        "updatedAt": updatedAt.toString(),
        "waVerified": waVerified,
        "_id": id,
        "__v": v,
      };
}
