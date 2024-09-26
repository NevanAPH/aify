import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<bool> obscure = true.obs;
  Rx<bool> loading = false.obs;
  Rx<bool> disable = false.obs;
  Rx<String> error1 = "".obs;
  Rx<String> error2 = "".obs;

  void setObscure(bool state) {
    obscure.value = state;
  }
  void setLoading(bool state) {
    loading.value = state;
  }
  void setDisabled(bool state) {
    disable.value = state;
  }
  void setError1(String err) {
    error1.value = err;
  }
  void setError2(String err) {
    error2.value = err;
  }
  void setSubmitting(bool state) {
    setLoading(state);
    setDisabled(state);
    setError1("");
    setError2("");
  }
  void clear() {
    setLoading(false);
    setDisabled(false);
    setError1("");
    setError2("");
  }
}