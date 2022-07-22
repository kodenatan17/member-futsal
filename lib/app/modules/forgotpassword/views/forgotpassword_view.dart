import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
  const ForgotpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ForgotpasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForgotpasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
