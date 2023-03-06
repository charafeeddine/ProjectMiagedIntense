import 'package:charafapp/configs/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  //* TEXT EDITING *************************/
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final dateNaissanceTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final codePostaleTextController = TextEditingController();
  final villePostaleTextController = TextEditingController();
  //* USER
  String? login;
  //* FIRESOTRE
  CollectionReference? userCollection;

  ProfileController() {
    //INIT USER COLLECTION DANS CONSTRUCTEUR
    userCollection = FirebaseFirestore.instance.collection('users');
    login = GetStorage().read('login');
    loginTextController.text = GetStorage().read('login');
  }

  //Init profile
  Future<dynamic> initProfile() async {
    userCollection?.doc(login).get().then((user) {
      addressTextController.text = user.get('address');
      dateNaissanceTextController.text = user.get('birthday');
      villePostaleTextController.text = user.get('city');
      passwordTextController.text = user.get('password');
      codePostaleTextController.text = user.get('postalCode');
    });
  }

  //Modifer profil
  Future<dynamic> editProfile() async {
    userCollection?.doc(login).update({
      'address': addressTextController.text,
      'birthday': dateNaissanceTextController.text,
      'city': villePostaleTextController.text,
      'password': passwordTextController.text,
      'postalCode': codePostaleTextController.text,
    }).then((_) {
      Get.snackbar(
        'Successfully',
        'Utilisateur a été modifer',
        backgroundColor: success,
        colorText: white,
      );
    }).catchError((_) {
      Get.snackbar(
        'Erreur',
        'quelque chose s\'est mal passé',
        backgroundColor: error,
        colorText: white,
      );
    });
  }

  Future<dynamic> logout() async {
    GetStorage().remove('login');
    Get.offAllNamed('/loginView');
  }
}
