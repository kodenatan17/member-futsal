import 'package:cloud_firestore/cloud_firestore.dart';

class FnbModel{
  String? docId;
  String? name;
  String? harga;

  FnbModel({this.docId, this.name, this.harga});

  FnbModel.fromMap(DocumentSnapshot data){
    docId = data.id;
    name = data["name"];
    harga = data["harga"];
  }
}