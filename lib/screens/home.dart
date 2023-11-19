import 'package:flutter/material.dart';
import 'package:flutter_setup/controller/language_controller.dart';
import 'package:flutter_setup/controller/user_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    LanguageController languageController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Setup'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text('login'.tr)),
            const SizedBox(
              width: 20,
            ),
            TextButton(onPressed: () {}, child: const Text('Register')),
          ]),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<UserController>(
                builder: (controller) {
                  return Text(
                      'Login User is ${userController.user.value?.name ?? ''}');
                },
              )
            ],
          ),
          Row(
            children: [
              FilledButton(
                  onPressed: () {
                    languageController.changeLanguage(Locale('my_MM'));
                  },
                  child: Text('Change Language'))
            ],
          )
        ]));
  }
}
