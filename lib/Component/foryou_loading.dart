import 'package:flutter/material.dart';
import 'package:newsapp/Component/loading_container.dart';

class ForyouLoading extends StatelessWidget {
  const ForyouLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: const Row(
          children: [
            LoadingContainer(width: 150, height: 180),
            SizedBox(width: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      LoadingContainer(width: 30, height: 30),
                      SizedBox(width: 5,),
                      LoadingContainer(width: 80, height: 20),
                    ],),
                    SizedBox(height: 10),
                    LoadingContainer(width: 120, height: 20),
                    SizedBox(height: 5,),
                    LoadingContainer(width: 120, height: 20),
                    SizedBox(height: 10),
                    LoadingContainer(width: 100, height: 20)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
