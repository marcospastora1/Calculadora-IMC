import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc/body.widget.dart';

import 'package:imc/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        actions: [
          IconButton(
              onPressed: controller.resetField, icon: const Icon(Icons.refresh))
        ],
      ),
      body: const Scroll(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade400,
        onPressed: () {
          Get.changeTheme(
            Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
          );
        },
        child: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode),
      ),
    );
  }
}
