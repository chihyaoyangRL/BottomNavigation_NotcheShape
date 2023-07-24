import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bottomnavigation_test/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottomnavigation_test/screen/Page_3/Page_3.dart';
import 'package:bottomnavigation_test/screen/page_4/Page_4.dart';
import 'package:bottomnavigation_test/screen/page_5/Page_5.dart';
import 'package:bottomnavigation_test/screen/home/home_page.dart';
import 'package:bottomnavigation_test/screen/authentication/login.dart';

class SlidingMenu extends State {
  final SlidingMenuController controller = Get.put(SlidingMenuController());
  late PersistentBottomSheetController controllerBottomSheet;

  showMenu(GlobalKey<ScaffoldState> key) {
    if (!controller.isOpen.value) {
      controllerBottomSheet = key.currentState!.showBottomSheet((context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                ListTile(
                  title: Text('Home'),
                  trailing: Icon(Icons.home),
                  onTap: () => Get.offAll(() => HomePage()),
                ),
                ListTile(
                  title: Text('Page 3'),
                  trailing: Icon(Icons.volunteer_activism),
                  onTap: () {
                    Get.back();
                    Get.to(() => Page3());
                  },
                ),
                ListTile(
                  title: Text('Page 4'),
                  trailing: Icon(FontAwesomeIcons.slidersH),
                  onTap: () {
                    Get.back();
                    Get.to(() => Page4());
                  },
                ),
                ListTile(
                  title: Text('Page 5'),
                  trailing: Icon(Icons.expand),
                  onTap: () {
                    Get.back();
                    Get.to(() => Page5());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(thickness: 2, color: cor_primary),
                ),
                ListTile(
                  title: Text('Logout'),
                  trailing: Icon(Icons.exit_to_app_sharp),
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove('login');
                    AudioCache(prefix: 'assets/audio/', fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP)).play('out.mp3');
                    Get.offAll(() => Login());
                  },
                ),
              ],
            );
          },
        );
      });
    } else {
      controllerBottomSheet.close();
    }
    controller.isOpen.value = !controller.isOpen.value;
  }

  @override
  Widget build(BuildContext context) => Container();
}

class SlidingMenuController extends GetxController {
  RxBool isOpen = false.obs;
}