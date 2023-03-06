import 'package:charafapp/configs/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  CollectionReference? userCollection;

  //* TEXT EDITING *************************/
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  UserController() {
    //INIT USER COLLECTION DANS CONSTRUCTEUR
    userCollection = FirebaseFirestore.instance.collection('users');
  }

  Future<dynamic> login({required login, required password}) async {
    //FLAG
    bool boolIsFound = false;
    //GET DOCUMENTS
    await userCollection?.get().then((documents) {
      //LOOP TOU LES DOCUMENTS
      for (var user in documents.docs) {
        if (user.id == login && user.get('password') == password) {
          boolIsFound = true;
          //ENRE. Ulistisateur connecté
          GetStorage().write('login', login);
          //ARRETER LE BOUCLE
          break;
        }
      }

      if (!boolIsFound) {
        Get.snackbar(
          'Erreur',
          'Aucun utilisateur trouvé',
          backgroundColor: error,
          colorText: white,
        );
      } else {
        Get.offAndToNamed('/appView');
      }
    });
  }
}
