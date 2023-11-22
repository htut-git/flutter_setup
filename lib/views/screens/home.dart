import 'package:flutter/material.dart';
import 'package:flutter_setup/app/controller/language_controller.dart';
import 'package:flutter_setup/app/services/networkcheck_service.dart';
import 'package:flutter_setup/app/services/user_service.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    UserService userService = Get.find();
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
              GetX<UserService>(
                builder: (controller) {
                  return Text(
                      'Login User is ${controller.user.value?.name ?? ''}');
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
          ),
          Row(
            children: [
              GetX<NetworkcheckService>(
              builder: (controller) {
                return Text('Network Connection is ${controller.networkStatus.value ? 'Connected' : 'Cannot Connected!'}');
              },
            )
            ],
          )
        ]));
  }
}
