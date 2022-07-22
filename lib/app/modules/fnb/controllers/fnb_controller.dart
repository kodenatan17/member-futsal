import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/FnbModel.dart';
import '../../../widgets/customFullScreenDialog.dart';
import '../../../widgets/customSnackBar.dart';

class FnbController extends GetxController {
  //TODO: Implement FnbController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final hargaC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collRefference;
  RxList<FnbModel> menus = RxList<FnbModel>([]);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    collRefference = firestore.collection("fnbs");
    menus.bindStream(getAllMenus());
  }

  @override
  void onClose() {
    super.onClose();
    nameC.dispose();
    hargaC.dispose();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Nama wajib diisi";
    }
    return null;
  }

  String? validateHarga(String value) {
    if (value.isEmpty) {
      return "Harga wajib diisi";
    }
    return null;
  }

  void saveUpdateMenu(
    String name,
    String harga,
    String docId,
    int addEditFlag,
  ) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();
      collRefference.add({'name': name, 'harga': harga}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Menu FnB Ditambahkan",
          message: "Berhasil Ditambahkan",
          backgroundColor: Colors.green,
        );
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Terjadi Kesalahan",
          backgroundColor: Colors.red,
        );
      });
    } else if (addEditFlag == 2) {
      CustomFullScreenDialog.showDialog();
      collRefference
          .doc(docId)
          .update({'name': name, 'harga': harga}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Menu FnB Updated",
            message: "Menu FnB Diupdate",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Terjadi Kesalahan",
            backgroundColor: Colors.red);
      });
    }
  }

  void clearEditingControllers() {
    nameC.clear();
    hargaC.clear();
  }

  Stream<List<FnbModel>> getAllMenus() => collRefference.snapshots().map(
      (query) => query.docs.map((item) => FnbModel.fromMap(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collRefference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      clearEditingControllers();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Menu FnB Dihapus",
          message: "Berhasil menghapus FnB",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Terjadi Kesalahan",
          backgroundColor: Colors.red);
    });
  }
}
