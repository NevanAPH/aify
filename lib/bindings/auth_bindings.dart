// create getx binding
import 'package:get/get.dart';
import 'package:aify/controllers/auth_controller.dart';
import 'package:aify/controllers/menus_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenusController());
    Get.lazyPut(() => AuthController());
  }
}