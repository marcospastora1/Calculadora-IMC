import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  var infoText = 'Informe seus dados'.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void resetField() {
    pesoController.text = '';
    alturaController.text = '';
    infoText.value = 'Informe seus dados';
    //formKey = GlobalKey<FormState>();
  }

  void calculate() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);

    if (imc < 18.5) {
      infoText.value =
          'Seu IMC é ${imc.toStringAsPrecision(3)}, portanto você está abaixo do peso';
    } else if (imc <= 24.9) {
      infoText.value =
          'Seu IMC é ${imc.toStringAsPrecision(3)}, portanto você está no seu peso Normal';
    } else if (imc <= 29.9) {
      infoText.value =
          'Seu IMC é ${imc.toStringAsPrecision(3)}, portanto você está Sobrepeso';
    } else if (imc <= 34.9) {
      infoText.value =
          'Seu IMC é ${imc.toStringAsPrecision(3)}, portanto você está Obesidade grau I';
    } else if (imc <= 39.9) {
      infoText.value =
          'Seu IMC é ${imc.toStringAsPrecision(3)}, portanto você está Obesidade grau II';
    } else if (imc >= 40) {
      infoText.value =
          'Seu IMC é ${imc.toStringAsPrecision(3)}, portanto você está Obesidade grau III';
    }
  }

  String? validatorPeso(value) {
    if (value.isEmpty) {
      return 'Insira seu peso';
    }
  }

  String? validatorAltura(value) {
    if (value.isEmpty) {
      return 'Insira sua altura';
    }
  }
}
