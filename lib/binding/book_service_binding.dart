import 'package:get/get.dart';
import '../controller/controller.dart';

class BookServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookServiceController());
  }
}
