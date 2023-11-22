// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_setup/app/controller/login_controller.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: loginController.phone,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: 'Phone'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: loginController.password,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                loginController.login();
              },
              child: const Text('Login'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back To Home'),
            ),
          )
        ]),
      ),
    );
  }
}
