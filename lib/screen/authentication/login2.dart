import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:bottomnavigation_test/utils/constants.dart';
import 'package:bottomnavigation_test/screen/authentication/login.dart';
import 'package:bottomnavigation_test/screen/authentication/login3.dart';
import 'package:bottomnavigation_test/screen/authentication/login4.dart';
import 'package:bottomnavigation_test/screen/authentication/login_controller.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
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
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: cor_secondary,
                      child: Center(child: Text('Im LogoMark', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: (MediaQuery.of(context).viewInsets.bottom == 0) ? 60.0 : 0.0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  Text('Login', style: TextStyle(color: Colors.white, fontSize: 30)),
                                  Container(
                                    margin: EdgeInsets.only(right: 25),
                                    child: SizedBox(
                                      width: 45,
                                      child: Divider(color: Color(0xffffd7b3), thickness: 2),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: TextField(
                                controller: emailController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.account_circle_outlined, color: Colors.white),
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  labelStyle: TextStyle(color: Colors.white),
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(30.0))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(30.0))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: TextField(
                                obscureText: true,
                                controller: senhaController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.multiline,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.vpn_key, color: Colors.white),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  labelStyle: TextStyle(color: Colors.white),
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(30.0))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(30.0))),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: (MediaQuery.of(context).viewInsets.bottom == 0) ? true : false,
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                                    onPressed: () => print('Create new Account'),
                                    child: Text('Create new Account', style: TextStyle(color: Colors.white, fontSize: 20)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Visibility(
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
                              ElevatedButton(
                                onPressed: () => Get.offAll(() => Login()),
                                style: ElevatedButton.styleFrom(primary: cor_secondary),
                                child: Text('Style 1'),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => Get.offAll(() => Login2()),
                                style: ElevatedButton.styleFrom(primary: cor_secondary),
                                child: Text('Style 2'),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => Get.offAll(() => Login3()),
                                style: ElevatedButton.styleFrom(primary: cor_secondary),
                                child: Text('Style 3'),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => Get.offAll(() => Login4()),
                                style: ElevatedButton.styleFrom(primary: cor_secondary),
                                child: Text('Style 4'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Obx(() => Text(controller.versaoNumber, style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => controller.save(),
                style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 60), primary: cor_secondary),
                child: Text('LOGIN', style: TextStyle(fontSize: 25)),
              )
            ],
          ),
        ),
      ),
    );
  }
}