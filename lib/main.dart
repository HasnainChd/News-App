import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Component/foryou_loading.dart';
import 'package:newsapp/Component/trending_loading.dart';
import 'package:newsapp/Pages/home_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePageController(),
      //home: const ForyouLoading(),
    );
  }
}
