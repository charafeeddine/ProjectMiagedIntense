import 'package:charafapp/configs/colors.dart';
import 'package:charafapp/controllers/clothe_controller.dart';
import 'package:charafapp/widgets/global/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  //* INJECTIONS **************************************************************/
  final ClotheController clotheController = Get.find<ClotheController>();
  //***************************************************************************/

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Panier'),
          actions: [
            TextButton.icon(
              onPressed: () {
                clotheController.clearPanier();
              },
              icon: const Icon(
                Icons.delete_forever,
                color: white,
              ),
              label: const Text(
                'Vider',
                style: TextStyle(color: white),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (clotheController.clothePanier!.isNotEmpty) ...[
                ...clotheController.clothePanier!.map(
                  (clothe) => Card(
                    child: ListTile(
                      leading: AvatarWidget(
                        path: clothe.image,
                      ),
                      title: Text(clothe.titre ?? ""),
                      subtitle: Text('Taille: ${clothe.taille}  | Caté: ${clothe.categorie}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: .80,
                            child: Chip(
                              label: Text('${clothe.prix} €'),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              clotheController.deleteClothePanier(clothe: clothe);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: error,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ] else ...[
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.checkroom,
                        size: 100,
                      ),
                      Text(
                        'Votre panier est vider'.toUpperCase(),
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
              if (clotheController.sommePrix() != 0) ...[
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.euro),
                    title: const Text(
                      'Total A payer:',
                      // style: Theme.of(context).textTheme.headline5,
                    ),
                    trailing: Text('${clotheController.sommePrix()} €'),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
