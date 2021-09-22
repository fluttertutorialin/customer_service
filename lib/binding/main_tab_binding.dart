import 'package:get/get.dart';
import '../controller/controller.dart';

class MainTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainTabController());

    Get.lazyPut(() => HomeController());
  }
}
