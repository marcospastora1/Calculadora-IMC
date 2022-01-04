import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.blue.shade400,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (Kg)',
                  labelStyle: TextStyle(color: Colors.blue.shade400),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue.shade400, fontSize: 25),
                controller: controller.pesoController,
                validator: controller.validatorPeso,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.blue.shade400),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue.shade400, fontSize: 25),
                controller: controller.alturaController,
                validator: controller.validatorAltura,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.calculate();
                      }
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade400,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.infoText.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue.shade400, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
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
