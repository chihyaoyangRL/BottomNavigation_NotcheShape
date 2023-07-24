import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bottomnavigation_test/screen/authentication/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomNavigation Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Login(),
    );
  }
}