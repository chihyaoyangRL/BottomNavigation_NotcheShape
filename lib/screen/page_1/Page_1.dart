import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bottomnavigation_test/screen/home/home_controller.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late ScrollController _hideBottomNavController;
  final HomeController controller = Get.put(HomeController());

  @override
  initState() {
    super.initState();
    _hideBottomNavController = ScrollController();
    _hideBottomNavController.addListener(() {
      if (_hideBottomNavController.position.userScrollDirection == ScrollDirection.reverse) {
        if (controller.isVisible.value) {
          controller.isVisible.value = false;
        }
      }
      if (_hideBottomNavController.position.userScrollDirection == ScrollDirection.forward) {
        if (!controller.isVisible.value) {
          controller.isVisible.value = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: ListView.builder(
              controller: _hideBottomNavController,
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) => Card(child: Text('Text $index')),
            ),
          )
        ],
      ),
    );
  }
}