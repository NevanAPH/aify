// create getx binding
import 'package:get/get.dart';
import 'package:aify/controllers/menus_controller.dart';
import 'package:aify/controllers/creations_controller.dart';

class DashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenusController());
    Get.lazyPut(() => CreationsController());
  }
}