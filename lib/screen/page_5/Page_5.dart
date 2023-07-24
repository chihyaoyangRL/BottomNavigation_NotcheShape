import 'package:get/get.dart';
import 'Page_5_controller.dart';
import 'package:flutter/material.dart';
import 'package:bottomnavigation_test/utils/constants.dart';
import 'package:bottomnavigation_test/widget/CustomLoading.dart';
import 'package:bottomnavigation_test/screen/home/home_page.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  final Page5Controller controller = Get.put(Page5Controller());
  List iconsD = [Icons.ad_units_outlined, Icons.radio, Icons.volunteer_activism, Icons.zoom_out_map_outlined, Icons.account_balance];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await Get.offAll(() => HomePage()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Page 5'),
          leading: IconButton(onPressed: () => Get.offAll(() => HomePage()), icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      highlightColor: Color.fromARGB(120 ~/ (index + 4), 20 ~/ (index + 3), 16 ~/ (index + 8), 1),
                      splashColor: Color.fromARGB(120 ~/ (index + 1), 20 * (index + 9), 86 * (index + 1), 1),
                      onTap: () => print('Click Me !'),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(120 ~/ (index + 1), 20 * (index + 9), 86 * (index + 1), 1),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Color.fromARGB(120 ~/ (index + 4), 20 ~/ (index + 3), 16 ~/ (index + 8), 1),
                          child: Center(child: Icon(iconsD[index], color: Colors.white, size: 17)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  radius: 1.0,
                  colors: <Color>[Colors.green, Colors.purpleAccent],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Text('I’m burning the memories', style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
            Loadingcolors(),
            SizedBox(height: 80),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 1000),
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 90),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Test BSLs"),
                                    Text("Rs. 2000"),
                                  ],
                                ),
                              );
                            },
                            body: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.justify),
                            isExpanded: controller.expanded.value,
                            canTapOnHeader: true,
                            backgroundColor: Colors.white,
                          ),
                        ],
                        dividerColor: Colors.grey,
                        expansionCallback: (panelIndex, isExpanded) => controller.isExpandeds(),
                      ),
                    )),
                Positioned(
                  top: -20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: cor_primary,
                      child: Center(child: Text('Im LogoMark', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}