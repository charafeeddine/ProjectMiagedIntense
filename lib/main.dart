import 'dart:async';

import 'package:charafapp/bindings/init_binding.dart';
import 'package:charafapp/configs/colors.dart';
import 'package:charafapp/middlewares/user_middleware.dart';
import 'package:charafapp/views/app_view.dart';
import 'package:charafapp/views/clothe_details_view.dart';
import 'package:charafapp/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  //* WAiT To INIt *************************************************************
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  //* RUN APP *****************************************************************/
  runApp(const MyApp());
  //***************************************************************************/
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MIAGED',
      initialBinding: InitBinding(),
      //? Themes
      theme: ThemeData(
        scaffoldBackgroundColor: background,
        //*************************** APPBAR THEMe ****************************/
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          centerTitle: false,
          foregroundColor: white,
          elevation: 0,
          iconTheme: IconThemeData(color: white),
        ),
        //*************************** COLOR's THEMEs **************************/
        colorScheme: const ColorScheme.light(
          primary: primary,
          secondary: secondary,
          background: background,
        ),
        //************************ DIVIDER THEMes *****************************/
        dividerTheme: const DividerThemeData(space: 3, color: divider),
        //*********************************************************************/
      ),
      //? PAGES
      getPages: [
        //? ---------------------- VIEWS ------------------------? //
        GetPage(
          name: '/loginView',
          page: () => const LoginView(),
          middlewares: [UserMiddleware()],
          binding: InitBinding(),
        ),
        GetPage(
          name: '/appView',
          page: () => const AppView(),
          binding: InitBinding(),
        ),
        GetPage(
          name: '/clotheDetailsView',
          page: () => const ClotheDetailsView(),
          binding: InitBinding(),
        ),
      ],
      initialRoute: '/loginView',
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomeApp();
  }
}
