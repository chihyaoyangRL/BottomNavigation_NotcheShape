import 'package:get/get.dart';

class Page5Controller extends GetxController {
  RxBool expanded = false.obs;

  isExpandeds() => expanded.value = !expanded.value;
}