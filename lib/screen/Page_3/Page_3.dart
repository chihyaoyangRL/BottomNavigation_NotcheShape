import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bottomnavigation_test/utils/constants.dart';
import 'package:bottomnavigation_test/screen/home/home_page.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: WillPopScope(
            onWillPop: () async => await Get.offAll(() => HomePage()),
            child: Scaffold(
              appBar: AppBar(
                title: Text('Page 3'),
                leading: IconButton(onPressed: () => Get.offAll(() => HomePage()), icon: Icon(Icons.arrow_back)),
              ),
              body: Stack(
                children: [
                  Container(color: cor_primary),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              image: DecorationImage(image: NetworkImage('https://blog.emania.com.br/wp-content/uploads/2015/12/paisagem-tropical-wallpaper-1.jpg'), fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: FittedBox(child: Text('Ckalso'))),
                              Icon(Icons.list),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 100,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: Get.width,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Card(color: Colors.indigo, child: Text('Text $index', style: TextStyle(color: Colors.white))),
                                      ),
                                    ),
                                    Positioned(
                                      top: 15,
                                      left: -15,
                                      child: RawMaterialButton(
                                        onPressed: () => null,
                                        elevation: 2.0,
                                        fillColor: Colors.white,
                                        shape: CircleBorder(),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 200.0,
          child: Stack(
            children: [
              Container(color: Colors.white),
              Container(
                decoration: BoxDecoration(color: cor_primary, borderRadius: BorderRadius.only(topRight: Radius.circular(75))),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 48, top: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Test', style: TextStyle(color: Colors.white)),
                            Text('See All', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 120,
                                      decoration: BoxDecoration(color: Color(0xff7da5f5), borderRadius: BorderRadius.circular(16)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(child: FittedBox(child: Text('Title', style: TextStyle(color: Colors.white)))),
                                          Flexible(child: FittedBox(child: Text('Subtitle', style: TextStyle(color: Colors.white)))),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(16), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
                                        width: 32,
                                        height: 32,
                                        child: Center(child: Icon(Icons.add)),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}