import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc/controller.dart';

class Scroll extends GetView<HomeController> {
  const Scroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
