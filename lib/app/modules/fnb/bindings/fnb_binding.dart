import 'package:get/get.dart';

import '../controllers/fnb_controller.dart';

class FnbBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FnbController>(
      () => FnbController(),
    );
  }
}
