import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserMiddleware extends GetMiddleware {
  //* ATTRIBUTES **************************************************************/
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    //? Check if user is connected!
    if (box.hasData('login')) {
      return const RouteSettings(name: '/appView');
    }

    return null;
  }
}
