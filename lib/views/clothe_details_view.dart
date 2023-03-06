import 'package:charafapp/configs/colors.dart';
import 'package:charafapp/controllers/clothe_controller.dart';
import 'package:charafapp/views/cart_view.dart';
import 'package:charafapp/models/clothe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

class ClotheDetailsView extends StatefulWidget {
  const ClotheDetailsView({super.key});

  @override
  State<ClotheDetailsView> createState() => _ClotheDetailsViewState();
}

class _ClotheDetailsViewState extends State<ClotheDetailsView> {
  //* INJECTIONS **************************************************************/
  final ClotheController clotheController = Get.find<ClotheController>();
  //***************************************************************************/

  //? ARGUMENET's
  Clothe clothe = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(clothe.titre.toString()),
      //   actions: [
      //   IconButton(
      //     icon: Icon(Icons.shopping_basket),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => cart_view()),
      //       );
      //     },
      //   ),
      // ],

        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartView()),
              );
            },
          ),
        ],
       
  
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageNetwork(
              image: clothe.image ?? '',
              height: Get.height / 3,
              width: Get.width,
              fitAndroidIos: BoxFit.cover,
              curve: Curves.easeIn,
            ),
            //********* NOM D'ARTICLE *********************************** */
            ListTile(
              leading: SizedBox(
                height: Get.height,
                child: const Icon(Icons.checkroom),
              ),
              title: Text(
                clothe.titre ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Nom d`article'),
            ),
            //********* PRIX D'ARTICLE *********************************** */
            ListTile(
              leading: SizedBox(
                height: Get.height,
                child: const Icon(Icons.euro),
              ),
              title: Text(
                '${clothe.prix}€',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Prix d`article'),
            ),
            //********* PRIX D'ARTICLE *********************************** */
            ListTile(
              leading: SizedBox(
                height: Get.height,
                child: const Icon(Icons.square_foot),
              ),
              title: Text(
                clothe.taille ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Taille d`article'),
            ),
            //********* PRIX D'ARTICLE *********************************** */
            ListTile(
              leading: SizedBox(
                height: Get.height,
                child: const Icon(Icons.category),
              ),
              title: Text(
                clothe.categorie ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Catégorie d`article'),
            ),

            ElevatedButton(
              onPressed: () {
                clotheController.addToPanier(clothe);
                Get.snackbar(
                  'Succès',
                  'Article a été ajouter',
                  colorText: white,
                  backgroundColor: success,
                );
              },
              child: const Text('Ajouter au panier'),
            )
          ],
        ),
      ),
    );
  }
}
