class Welcome {
    String message;
    bool status;
    int errorCode;
    User user;

    Welcome({
        required this.message,
        required this.status,
        required this.errorCode,
        required this.user,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        status: json["status"],
        errorCode: json["errorCode"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "errorCode": errorCode,
        "user": user.toJson(),
    };
}

class User {
    String name;
    String email;
    String password;
    String mobileNumber;
    String gid;
    String referralCode;
    String firstName;
    String lastName;
    String userRole;
    String profilePic;
    String status;
    bool active;
    bool softDelete;
    bool flag;
    DateTime createdAt;
    DateTime updatedAt;
    bool waVerified;
    String id;
    int v;

    User({
        required this.name,
        required this.email,
        required this.password,
        required this.mobileNumber,
        required this.gid,
        required this.referralCode,
        required this.firstName,
        required this.lastName,
        required this.userRole,
        required this.profilePic,
        required this.status,
        required this.active,
        required this.softDelete,
        required this.flag,
        required this.createdAt,
        required this.updatedAt,
        required this.waVerified,
        required this.id,
        required this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        mobileNumber: json["mobile_number"],
        gid: json["gid"],
        referralCode: json["referral_code"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userRole: json["user_role"],
        profilePic: json["profile_pic"],
        status: json["status"],
        active: json["active"],
        softDelete: json["soft_delete"],
        flag: json["flag"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        waVerified: json["waVerified"],
        id: json["_id"],
        v: json["__v"],
    );

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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "waVerified": waVerified,
        "_id": id,
        "__v": v,
    };
}