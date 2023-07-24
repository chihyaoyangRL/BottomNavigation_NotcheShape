import 'dart:math';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Loadingcolors extends StatefulWidget {
  const Loadingcolors({Key? key}) : super(key: key);

  @override
  _LoadingcolorsState createState() => _LoadingcolorsState();
}

class _LoadingcolorsState extends State<Loadingcolors> {
  final LoadingController controller = Get.put(LoadingController());
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => controller.randomColor.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) => Obx(() => CircularProgressIndicator(color: controller.randomColor.value));
}

class LoadingController extends GetxController {
  Rx<MaterialColor> randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)].obs;
}