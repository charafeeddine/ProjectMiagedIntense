import 'package:charafapp/controllers/app_controller.dart';
import 'package:charafapp/controllers/clothe_controller.dart';
import 'package:charafapp/controllers/profile_controller.dart';
import 'package:charafapp/controllers/user_controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ClotheController>(() => ClotheController());
  }
}
