import 'package:get/get.dart';

class MenusController extends GetxController {
  Rx<int> selected = 0.obs;
  Rx<bool> locked = false.obs;

  void setSelected(int index) {
    selected.value = index;
  }
  void setLocked(bool state) {
    locked.value = state;
  }
}