import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel{
  String? docId;
  String? name;
  String? phone;

  MemberModel({this.docId, this.name, this.phone});

  MemberModel.fromMap(DocumentSnapshot data){
    docId = data.id;
    name = data["name"];
    phone = data["phone"];
  }
}