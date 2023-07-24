import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isVisible = true.obs;
  RxInt selectedIndex = 0.obs;

  onItemTapped(int index) => selectedIndex.value = index;
}