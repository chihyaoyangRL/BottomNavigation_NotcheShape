import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bottomnavigation_test/utils/constants.dart';
import 'package:bottomnavigation_test/screen/Page_3/Page_3.dart';
import 'package:bottomnavigation_test/screen/home/home_page.dart';
import 'package:bottomnavigation_test/screen/authentication/login2.dart';
import 'package:bottomnavigation_test/screen/authentication/login3.dart';
import 'package:bottomnavigation_test/screen/authentication/login4.dart';
import 'package:bottomnavigation_test/screen/authentication/login_controller.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final LoginController controller = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String shortcut = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    controller.getPackageInfo();
    final QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) => shortcut = shortcutType);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      quickActions.setShortcutItems(<ShortcutItem>[
        const ShortcutItem(type: 'page3', localizedTitle: 'Page 3', icon: 'qki'),
      ]).then((value) {
        if (shortcut == 'page3') {
          if (prefs.getInt('login') == null) {
            Get.offAll(() => Login());
          } else {
            Get.to(() => Page3());
          }
        }
      });
      if (prefs.getInt('login') != null) {
        Get.offAll(() => HomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: Get.width,
        color: Colors.purpleAccent,
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
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                right: 5,
                child: Obx(() => Text(controller.versaoNumber, style: TextStyle(color: Colors.white))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Visibility(
                    visible: (MediaQuery.of(context).viewInsets.bottom == 0) ? true : false,
                    child: Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Color(0xffa57aeb),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: cor_primary,
                          child: Center(child: Text('Im LogoMark', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                                  padding: const EdgeInsets.only(left: 30, right: 30),
                                  child: ElevatedButton(
                                    onPressed: () => print('Sign Up'),
                                    style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 70), primary: cor_primary),
                                    child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 50, bottom: (MediaQuery.of(context).viewInsets.bottom == 0) ? 60.0 : 0.0),
                              child: Card(
                                elevation: 0.0,
                                color: Colors.black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
                                                child: Divider(color: Colors.green, thickness: 2),
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
                                            hintText: 'Email Address',
                                            hintStyle: TextStyle(color: Colors.white),
                                            filled: true,
                                            labelStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.3),
                                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(5.0))),
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(5.0))),
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
                                            hintText: 'Password',
                                            hintStyle: TextStyle(color: Colors.white),
                                            filled: true,
                                            labelStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.3),
                                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(5.0))),
                                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: const BorderRadius.all(const Radius.circular(5.0))),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: ElevatedButton(
                                          onPressed: () => controller.save(),
                                          style: ElevatedButton.styleFrom(primary: cor_primary, minimumSize: Size(Get.width, 50)),
                                          child: Text('Login'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20, left: 2.5),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                                            onPressed: () => print('Forgot Password ?'),
                                            child: Text('Forgot Password ?', style: TextStyle(color: cor_primary)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: (MediaQuery.of(context).viewInsets.bottom == 0) ? true : false,
                child: Positioned(
                  bottom: 0,
                  child: Container(
                    height: 35,
                    width: Get.width / 2,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ElevatedButton(
                          onPressed: () => Get.offAll(() => Login()),
                          style: ElevatedButton.styleFrom(primary: cor_primary),
                          child: Text('Style 1'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => Get.offAll(() => Login2()),
                          style: ElevatedButton.styleFrom(primary: cor_primary),
                          child: Text('Style 2'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => Get.offAll(() => Login3()),
                          style: ElevatedButton.styleFrom(primary: cor_primary),
                          child: Text('Style 3'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => Get.offAll(() => Login4()),
                          style: ElevatedButton.styleFrom(primary: cor_primary),
                          child: Text('Style 4'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}