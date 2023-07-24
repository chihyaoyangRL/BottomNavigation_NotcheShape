import 'package:get/get.dart';
import 'login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottomnavigation_test/utils/constants.dart';
import 'package:bottomnavigation_test/screen/authentication/login.dart';
import 'package:bottomnavigation_test/screen/authentication/login2.dart';
import 'package:bottomnavigation_test/screen/authentication/login3.dart';

class Login4 extends StatefulWidget {
  const Login4({Key? key}) : super(key: key);

  @override
  _Login4State createState() => _Login4State();
}

class _Login4State extends State<Login4> {
  final LoginController controller = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    controller.getPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: new BoxDecoration(image: DecorationImage(image: new ExactAssetImage('assets/banner/banner.jpg'), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                const Color.fromRGBO(162, 146, 199, 0.9),
                const Color.fromRGBO(51, 51, 63, 0.9),
              ],
              stops: [0.2, 1.0],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                visible: (MediaQuery.of(context).viewInsets.bottom == 0) ? true : false,
                child: Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    child: Obx(() => CircleAvatar(
                          radius: 75,
                          backgroundColor: controller.formEnable.value ? Color(0xffFEB099) : cor_quaternary,
                          child: Center(child: Text('Im LogoMark', style: TextStyle(color: Colors.white))),
                        )),
                  ),
                ),
              ),
              Obx(() => Visibility(
                    visible: controller.formEnable.value,
                    child: Expanded(
                      flex: 2,
                      child: ListView(
                        children: [
                          Stack(
                            children: [
                              Visibility(
                                visible: (MediaQuery.of(context).viewInsets.bottom == 0) ? true : false,
                                child: Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 70, right: 70),
                                    child: ElevatedButton(
                                      onPressed: () => controller.formEnable.value = false,
                                      style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 70), primary: Color(0xffFEB099)),
                                      child: Text('Back', style: TextStyle(color: Colors.white, fontSize: 22)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 50, bottom: (MediaQuery.of(context).viewInsets.bottom == 0) ? 60.0 : 0.0, left: 20, right: 20),
                                child: Card(
                                  elevation: 0.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextField(
                                          controller: emailController,
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(labelText: 'USERNAME', labelStyle: TextStyle(color: Colors.black)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextField(
                                          obscureText: true,
                                          controller: senhaController,
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.multiline,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(labelText: 'PASSWORD', labelStyle: TextStyle(color: Colors.black)),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => controller.save(),
                                        style: ElevatedButton.styleFrom(primary: Color(0xffFEB099), minimumSize: Size(Get.width, 50)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18)),
                                            Icon(Icons.arrow_forward_outlined, color: Colors.white),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Obx(() => Visibility(
                    visible: !controller.formEnable.value,
                    child: Expanded(
                      flex: 2,
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50, bottom: (MediaQuery.of(context).viewInsets.bottom == 0) ? 60.0 : 0.0),
                            child: Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: Get.width / 1.4,
                                      height: 40,
                                      color: Color(0xff095187),
                                      child: ElevatedButton(
                                        onPressed: () => controller.formEnable.value = true,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.verified_user, color: Colors.white),
                                            Flexible(child: FittedBox(child: Text('LOGIN', style: TextStyle(fontSize: 30, color: Colors.white)))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: Get.width / 2,
                                        height: 40,
                                        color: Color(0xff095187),
                                        child: ElevatedButton(
                                          onPressed: () => print('SIGNUP'),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.edit, color: Colors.white),
                                              Flexible(child: FittedBox(child: Text('SIGNUP', style: TextStyle(fontSize: 20, color: Colors.white)))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: Get.width / 2.5,
                                        height: 40,
                                        color: Color(0xff095187),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              title: 'Warning',
                                              content: Container(
                                                height: 100,
                                                width: Get.width,
                                                child: Center(
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(15.0),
                                                        child: Text('Digite sua email para recuperar sua senha.'),
                                                      ),
                                                      TextField(
                                                        controller: emailController,
                                                        style: TextStyle(color: Colors.black),
                                                        keyboardType: TextInputType.emailAddress,
                                                        cursorColor: Colors.black,
                                                        decoration: InputDecoration(
                                                          suffixIcon: Icon(Icons.email, color: Colors.black),
                                                          hintText: 'Email Address',
                                                          hintStyle: TextStyle(color: Colors.black),
                                                          filled: true,
                                                          labelStyle: TextStyle(color: Colors.black),
                                                          fillColor: cor_quaternary.withOpacity(0.3),
                                                          border: OutlineInputBorder(borderSide: BorderSide(color: cor_quaternary), borderRadius: const BorderRadius.all(const Radius.circular(30.0))),
                                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: cor_quaternary), borderRadius: const BorderRadius.all(const Radius.circular(30.0))),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: Text('Send', style: TextStyle(color: Colors.white, fontSize: 18)),
                                                  onPressed: () => Get.back(),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: cor_quaternary,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.mark_email_unread, color: Colors.white),
                                              Flexible(child: FittedBox(child: Text('Forgot Password ?', style: TextStyle(fontSize: 15, color: Colors.white)))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: (MediaQuery.of(context).viewInsets.bottom == 0) ? true : false,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 35,
                        width: Get.width / 2,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Obx(() => ElevatedButton(
                                onPressed: () => Get.offAll(() => Login()),
                                style: ElevatedButton.styleFrom(primary: controller.formEnable.value ? Color(0xffFEB099) : cor_quaternary),
                                child: Text('Style 1'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Obx(() => ElevatedButton(
                                onPressed: () => Get.offAll(() => Login2()),
                                style: ElevatedButton.styleFrom(primary: controller.formEnable.value ? Color(0xffFEB099) : cor_quaternary),
                                child: Text('Style 2'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Obx(() => ElevatedButton(
                                onPressed: () => Get.offAll(() => Login3()),
                                style: ElevatedButton.styleFrom(primary: controller.formEnable.value ? Color(0xffFEB099) : cor_quaternary),
                                child: Text('Style 3'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Obx(() => ElevatedButton(
                                onPressed: () => Get.offAll(() => Login4()),
                                style: ElevatedButton.styleFrom(primary: controller.formEnable.value ? Color(0xffFEB099) : cor_quaternary),
                                child: Text('Style 4'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() => Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 8),
                    child: Text(controller.versaoNumber, style: TextStyle(color: Colors.white)),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}