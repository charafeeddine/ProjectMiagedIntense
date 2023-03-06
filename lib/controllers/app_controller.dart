import 'package:get/get.dart';

class AppController extends GetxController {
  //Tab index
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;

    update();
  }
}
