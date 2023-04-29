import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("user");

  final CollectionReference groupcollection =
      FirebaseFirestore.instance.collection("groups");

  Future updateUserData(String fullName, String email) async {
    return await usercollection.doc(uid).set({
      "fullname": fullName,
      "email": email,
      "groups": [],
      "profilepic": "",
      "uid": uid,
    });
  }
}
