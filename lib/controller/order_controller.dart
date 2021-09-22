import 'package:get/get.dart';

class OrderController extends GetxController {
  @override
  void onInit() async {
    await getOngoingTasks();
    super.onInit();
  }

  Future refreshTasks({bool showMessage = false}) async {}

  Future<void> getOngoingTasks() async {}

  Future<void> getCompletedTasks() async {}

  Future<void> getArchivedTasks() async {

  }

}
