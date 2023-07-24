import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bottomnavigation_test/screen/home/home_page.dart';
import 'package:bottomnavigation_test/screen/page_4/Page_4_controller.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final Page4Controller controller = Get.put(Page4Controller());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await Get.offAll(() => HomePage()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Page 4'),
          leading: IconButton(onPressed: () => Get.offAll(() => HomePage()), icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Obx(() => Slider(
                  activeColor: Colors.red,
                  inactiveColor: Colors.red.withOpacity(0.5),
                  value: controller.red.value,
                  min: 0,
                  max: 255,
                  divisions: 255,
                  label: controller.red.value.round().toString(),
                  onChanged: (double value) => controller.red.value = value,
                )),
            Obx(() => Slider(
                  activeColor: Colors.green,
                  inactiveColor: Colors.green.withOpacity(0.5),
                  value: controller.green.value,
                  min: 0,
                  max: 255,
                  divisions: 255,
                  label: controller.green.value.round().toString(),
                  onChanged: (double value) => controller.green.value = value,
                )),
            Obx(() => Slider(
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue.withOpacity(0.5),
                  value: controller.blue.value,
                  min: 0,
                  max: 255,
                  divisions: 255,
                  label: controller.blue.value.round().toString(),
                  onChanged: (double value) => controller.blue.value = value,
                )),
            Obx(() => CustomPaint(painter: Painter(controller.red.value.toInt(), controller.green.value.toInt(), controller.blue.value.toInt(), MediaQuery.of(context).size))),
            Padding(
              padding: const EdgeInsets.only(top: 120.0, right: 25),
              child: Align(
                alignment: Alignment.centerRight,
                child: Obx(() => Text(
                  controller.hexOfRGBA(controller.red.value.toInt(), controller.green.value.toInt(), controller.blue.value.toInt()),
                  style: TextStyle(fontSize: 20, color: Color.fromRGBO(controller.red.value.toInt(), controller.green.value.toInt(), controller.blue.value.toInt(), 1)),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  final Size screenSize;
  final int red;
  final int green;
  final int blue;

  Painter(this.red, this.green, this.blue, this.screenSize);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTWH(-180, 0, 350, 90);
    var paint = Paint()..strokeWidth = 1.0..color = Color.fromRGBO(red, green, blue, 1.0);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}