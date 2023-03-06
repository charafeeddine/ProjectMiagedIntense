import 'package:charafapp/configs/colors.dart';
import 'package:charafapp/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  //* INJECTIONS **************************************************************/
  final ProfileController profileController =
      Get.isRegistered<ProfileController>() ? Get.find<ProfileController>() : Get.put(ProfileController());
  //***************************************************************************/

  @override
  void initState() {
    super.initState();

    profileController.initProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: profileController.loginTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  suffixIcon: const Icon(Icons.account_circle),
                  filled: true,
                  hintText: 'Login',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: profileController.passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  suffixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  hintText: 'Mot de passe',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: profileController.dateNaissanceTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  suffixIcon: const Icon(Icons.calendar_month),
                  filled: true,
                  hintText: 'Date de naissance',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: profileController.addressTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  suffixIcon: const Icon(Icons.map),
                  filled: true,
                  hintText: 'Addresse',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: profileController.codePostaleTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  suffixIcon: const Icon(Icons.tag),
                  filled: true,
                  hintText: 'Code postale',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: profileController.villePostaleTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  suffixIcon: const Icon(Icons.location_city),
                  filled: true,
                  hintText: 'Ville',
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(validate),
                  ),
                  onPressed: () async {
                    profileController.editProfile();
                  },
                  child: const Text('Edit profile'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(error),
                  ),
                  onPressed: () async {
                    profileController.logout();
                  },
                  child: const Text('Se déconnecter'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
