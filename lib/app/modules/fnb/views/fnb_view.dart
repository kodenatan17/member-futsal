import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fnb_controller.dart';

class FnbView extends GetView<FnbController> {
  const FnbView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FnbView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FnbView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
