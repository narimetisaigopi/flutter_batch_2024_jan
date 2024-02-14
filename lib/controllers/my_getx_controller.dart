import 'package:get/get_state_manager/get_state_manager.dart';

class MyGetxController extends GetxController {
  int count = 1;

  increaseCount() {
    count++;
    update();
  }

  decrementCount() {
    count--;
    update();
  }
}
