import 'package:charafapp/configs/colors.dart';
import 'package:charafapp/controllers/user_controller.dart';
import 'package:charafapp/widgets/clippaths/login_clip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //* INJECTIONS **************************************************************/
  final UserController userController =
      Get.isRegistered<UserController>() ? Get.find<UserController>() : Get.put(UserController());
  //***************************************************************************/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: DrawLogin(),
                  child: Container(
                    height: Get.height * .32,
                    color: primary,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //******************** SPACING *************************/
                        SizedBox(height: Get.height * .05),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            'MIAGED',
                            style: Theme.of(context).textTheme.headline3?.copyWith(color: validate),
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            'The best for the best',
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      'Connexion',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: userController.loginTextController,
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
                    controller: userController.passwordTextController,
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
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(validate),
                  ),
                      onPressed: () async {
                        userController.login(
                          login: userController.loginTextController.text,
                          password: userController.passwordTextController.text,
                        );
                      },
                      child: const Text('Se connecter'),
                    ),
                  ),
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
