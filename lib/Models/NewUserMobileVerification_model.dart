class Welcome {
    String message;
    bool status;

    Welcome({
        required this.message,
        required this.status,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],  
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}