import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Component/bottom_navbar.dart';
import 'package:newsapp/Controllers/bottom_navbar_controller.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBarController controller = Get.put(BottomNavBarController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const MyBottomNavbar(),
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
    );
  }
}
