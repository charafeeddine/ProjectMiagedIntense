import 'package:charafapp/controllers/clothe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

class ClotheView extends StatefulWidget {
  const ClotheView({super.key});

  @override
  State<ClotheView> createState() => _ClotheViewState();
}

class _ClotheViewState extends State<ClotheView> {
  //* INJECTIONS **************************************************************/
  final ClotheController clotheController = Get.find<ClotheController>();
  //***************************************************************************/

  @override
  void initState() {
    super.initState();
    clotheController.initClothes();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Acheter'),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return const [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Toute"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("T-Shirt"),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("Jean"),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text("Chaussures"),
                ),
              ];
            }, onSelected: (value) {
              if (value == 0) {
                clotheController.initClothes();
              }
              if (value == 1) {
                clotheController.getClothesByCategory(category: 'tshirt');
              }
              if (value == 2) {
                clotheController.getClothesByCategory(category: 'jean');
              }
               if (value == 3) {
                clotheController.getClothesByCategory(category: 'chaussures');
              }
            }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ...clotheController.clothes!.map(
                (vtm) => InkWell(
                  onTap: () => Get.toNamed('/clotheDetailsView', arguments: vtm),
                  child: Card(
                    child: Column(
                      children: [
                        ImageNetwork(
                          onTap: () => Get.toNamed('/clotheDetailsView', arguments: vtm),
                          image: vtm.image ?? '',
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
                            vtm.titre ?? "",
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
                            '${vtm.prix}€',
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
                            vtm.taille ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Taille d`article'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
