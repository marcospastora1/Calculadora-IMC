import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc/binding.dart';
import 'package:imc/home.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/home',
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => const HomePage(), binding: HomeBinding()),
      ],
    ),
  );
}
