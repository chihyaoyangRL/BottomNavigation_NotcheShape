import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bottomnavigation_test/widget/SlidingMenu.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:bottomnavigation_test/screen/page_1/Page_1.dart';
import 'package:bottomnavigation_test/screen/page_2/Page_2.dart';
import 'package:bottomnavigation_test/screen/home/home_controller.dart';
import 'package:bottomnavigation_test/utils/CustomBottomNavigationBaritem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin, WidgetsBindingObserver {
  List<Widget> pages() => [Page1(), Page2()];
  SlidingMenu slm = SlidingMenu();
  final SlidingMenuController slmController = Get.find();
  final HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    WidgetsBinding.instance!.addPostFrameCallback((_) async => player = await AudioCache(prefix: 'assets/bgm/', fixedPlayer: AudioPlayer()).loop('wbjb.mp3'));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        player.resume();
        break;
      case AppLifecycleState.inactive:
        player.pause();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> page = pages();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('BottomNavigation Test'), automaticallyImplyLeading: false),
      body: Obx(() => page[controller.selectedIndex.value]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: slmController.isOpen.value ? 56.0 : controller.isVisible.value ? 56.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: slmController.isOpen.value ? Colors.green : Colors.indigo[300],
            child: AnimatedIconButton(
              duration: Duration(milliseconds: 200),
              icons: [
                AnimatedIconItem(icon: Icon(Icons.keyboard_arrow_up, color: Colors.white)),
                AnimatedIconItem(icon: Icon(Icons.keyboard_arrow_down, color: Colors.white)),
              ],
              onPressed: () => slm.showMenu(scaffoldKey),
            ),
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: controller.isVisible.value ? 56.0 : 0.0,
          child: FABBottomAppBar(
            color: Colors.white,
            selectedColor: Colors.yellowAccent,
            notchedShape: CircularNotchedRectangle(),
            onTabSelected: (value) => controller.onItemTapped(value),
            items: [
              FABBottomAppBarItem(iconData: Icons.home, text: 'Page 1'),
              FABBottomAppBarItem(iconData: Icons.calculate, text: 'Calculator'),
            ],
          ),
        );
      }),
    );
  }
}