import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bottomnavigation_test/screen/home/home_page.dart';

class LoginController extends GetxController {
  RxString versao = ''.obs;
  RxString versaoBuildNumber = ''.obs;
  RxBool formEnable = false.obs;

  String get versaoNumber => "${versao.value}+${versaoBuildNumber.value}";

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versao.value = packageInfo.version;
    versaoBuildNumber.value = packageInfo.buildNumber;
  }

  save() async {
    AudioCache(prefix: 'assets/audio/', fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP)).play('ign.mp3');
    Future.delayed(const Duration(seconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('login', 1);
      Get.offAll(() => HomePage());
      AudioCache(prefix: 'assets/audio/', fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP)).play('fir.mp3');
    });
  }
}