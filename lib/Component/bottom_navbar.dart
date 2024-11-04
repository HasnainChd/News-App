import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Controllers/bottom_navbar_controller.dart';

class MyBottomNavbar extends StatelessWidget {
  const MyBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBarController controller = Get.put(BottomNavBarController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Container(
            margin: const EdgeInsets.all(20),
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //container 1
                InkWell(
                  onTap: () {
                    controller.selectedIndex.value = 0;
                  },
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: controller.selectedIndex.value == 0
                              ? Colors.amber
                              : null),
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color: controller.selectedIndex.value == 0
                            ? Colors.white
                            : Colors.grey,
                      )),
                ),

                //container 2
                InkWell(
                  onTap: () {
                    controller.selectedIndex.value = 1;
                  },
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: controller.selectedIndex.value == 1
                              ? Colors.amber
                              : null),
                      child: Icon(
                        Icons.book,
                        size: 30,
                        color: controller.selectedIndex.value == 1
                            ? Colors.white
                            : Colors.grey,
                      )),
                ),

                //Container 3
                InkWell(
                  onTap: () {
                    controller.selectedIndex.value = 2;
                  },
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: controller.selectedIndex.value == 2
                              ? Colors.amber
                              : null),
                      child:  Icon(Icons.settings,
                          size: 30, color: controller.selectedIndex.value ==2
                            ? Colors.white
                            : Colors.grey,)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
