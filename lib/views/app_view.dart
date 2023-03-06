import 'package:charafapp/controllers/app_controller.dart';
import 'package:charafapp/views/cart_view.dart';
import 'package:charafapp/views/clothe_view.dart';
import 'package:charafapp/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Configs
import '/configs/colors.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (managerClueController) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              backgroundColor: primary,
            ),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: managerClueController.tabIndex,
              children: const [
                ClotheView(),
                CartView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            onTap: managerClueController.changeTabIndex,
            currentIndex: managerClueController.tabIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primary,
            unselectedItemColor: primary.withOpacity(0.7),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money, size: 30),
                label: 'Acheter',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket, size: 30),
                label: 'Panier',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 30),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
