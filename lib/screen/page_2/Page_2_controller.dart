import 'package:get/get.dart';

class Page2Controller extends GetxController {
  RxString text = ''.obs;
  RxString answer = ''.obs;
  RxBool isAnswer = false.obs;

  clearAll() {
    text.value = '';
    text.value = '';
    isAnswer.value = false;
  }
}