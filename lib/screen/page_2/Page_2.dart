import 'package:get/get.dart';
import 'Page_2_controller.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final Page2Controller controller = Get.put(Page2Controller());

  @override
  Widget build(BuildContext context) {
    const double fontS = 25;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Container(
                color: Colors.greenAccent[700],
                child: Center(
                  child: Obx(() => Text((controller.isAnswer.value) ? controller.answer.value : controller.text.value, style: TextStyle(color: Colors.white))),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: kFloatingActionButtonMargin + 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.clearAll(),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Colors.blue),
                            child: Center(child: Text('C', style: TextStyle(color: Colors.white, fontSize: fontS))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.isAnswer.value ? null : controller.text.value += '+',
                          child: Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.orange),
                              child: Center(child: Text('+', style: TextStyle(color: Colors.white, fontSize: fontS))),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.isAnswer.value ? null : controller.text.value += '-',
                          child: Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.orange),
                              child: Center(child: Text('-', style: TextStyle(color: Colors.white, fontSize: fontS))),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.isAnswer.value ? null : controller.text.value += '*',
                          child: Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.orange),
                              child: Center(child: Text('*', style: TextStyle(color: Colors.white, fontSize: fontS))),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.isAnswer.value ? null : controller.text.value += '/',
                          child: Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.orange),
                              child: Center(child: Text('/', style: TextStyle(color: Colors.white, fontSize: fontS))),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 1; i <= 3; i++)
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.isAnswer.value ? null : controller.text.value += i.toString(),
                            child: Obx(() {
                              return Container(
                                height: 50,
                                decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.blue),
                                child: Center(child: Text(i.toString(), style: TextStyle(color: Colors.white, fontSize: fontS))),
                              );
                            }),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 4; i <= 6; i++)
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.isAnswer.value ? null : controller.text.value += i.toString(),
                            child: Obx(() {
                              return Container(
                                height: 50,
                                decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.blue),
                                child: Center(child: Text(i.toString(), style: TextStyle(color: Colors.white, fontSize: fontS))),
                              );
                            }),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 7; i <= 9; i++)
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.isAnswer.value ? null : controller.text.value += i.toString(),
                            child: Obx(() {
                              return Container(
                                height: 50,
                                decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.blue),
                                child: Center(child: Text(i.toString(), style: TextStyle(color: Colors.white, fontSize: fontS))),
                              );
                            }),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.isAnswer.value ? null : controller.text.value += '%',
                          child: Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.orange),
                              child: Center(child: Text('%', style: TextStyle(color: Colors.white, fontSize: fontS))),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.isAnswer.value ? null : controller.text.value += '.',
                          child: Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.orange),
                              child: Center(child: Text('.', style: TextStyle(color: Colors.white, fontSize: fontS))),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => (controller.text.value.length != 0) ? controller.text.value = controller.text.value.substring(0, controller.text.value.length - 1) : null,
                          child: Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.orange),
                              child: Center(child: Text('DEL', style: TextStyle(color: Colors.white, fontSize: fontS))),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.text.value.isNotEmpty) {
                        controller.isAnswer.value = true;
                        String finalUserinput = controller.text.value;
                        finalUserinput = controller.text.value.replaceAll('x', '*');
                        Parser p = Parser();
                        Expression exp = p.parse(finalUserinput);
                        ContextModel cm = ContextModel();
                        double eval = exp.evaluate(EvaluationType.REAL, cm);
                        controller.answer.value = eval.toString();
                      }
                    },
                    child: Obx(() {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(border: Border.all(color: Colors.white), color: controller.isAnswer.value ? Colors.grey : Colors.blue),
                        child: Center(child: Text('=', style: TextStyle(color: Colors.white, fontSize: fontS))),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}