import 'package:charafapp/models/clothe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClotheController extends GetxController {
  //* FIRESOTRE
  CollectionReference? clotheCollection;
  //* USER
  String? login;
  //* MODEL
  RxList<Clothe>? clothes;
  RxList<Clothe>? clothePanier;

  ClotheController() {
    //INIT USER COLLECTION DANS CONSTRUCTEUR
    clotheCollection = FirebaseFirestore.instance.collection('vetements');
    //CONNECTED USER ID
    login = GetStorage().read('login');
    //INIT VETEMENTS VAR
    clothes = List<Clothe>.empty(growable: true).obs;
    clothePanier = List<Clothe>.empty(growable: true).obs;
  }

  //INT VETEMETNS
  Future<dynamic> initClothes() async {
    clothes?.clear();
    //GET DOCUMENTS
    await clotheCollection?.get().then((documents) {
      //LOOP TOU LES DOCUMENTS
      for (var vetement in documents.docs) {
        Clothe tmpClothe = Clothe();
        tmpClothe.id = vetement.get('id');
        tmpClothe.image = vetement.get('image');
        tmpClothe.titre = vetement.get('titre');
        tmpClothe.prix = vetement.get('prix');
        tmpClothe.taille = vetement.get('taille');
        tmpClothe.categorie = vetement.get('categorie');
        //
        clothes?.add(tmpClothe);
      }
    });
  }

  Future<dynamic> getClothesByCategory({required category}) async {
    clothes?.clear();

    await clotheCollection?.where('categorie', isEqualTo: category).get().then((documents) {
      for (var vetement in documents.docs) {
        Clothe tmpClothe = Clothe();
        tmpClothe.id = vetement.get('id');
        tmpClothe.image = vetement.get('image');
        tmpClothe.titre = vetement.get('titre');
        tmpClothe.prix = vetement.get('prix');
        tmpClothe.taille = vetement.get('taille');
        tmpClothe.categorie = vetement.get('categorie');
        //
        clothes?.add(tmpClothe);
      }
    });
  }

  // ?AJOUER AU PANIER
  Future<dynamic> addToPanier(Clothe clothe) async {
    clothePanier?.add(clothe);
  }

  //? CLEAR PANIER
  Future<dynamic> clearPanier() async {
    clothePanier?.clear();
  }

  //? DELETE FORM PANIER
  Future<dynamic> deleteClothePanier({required Clothe clothe}) async {
    clothePanier?.removeWhere((element) => element.id == clothe.id);
  }

  //? SOMME DES PRIX
  double sommePrix() {
    double somme = 0;
    for (var cl in clothePanier!) {
      somme += double.tryParse(cl.prix ?? '')!;
    }
    return somme;
  }
}
