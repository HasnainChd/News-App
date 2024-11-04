import 'package:flutter/material.dart';
import 'package:newsapp/Component/loading_container.dart';

class TrendingLoading extends StatelessWidget {
  const TrendingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: 300, // Adjust the size as per your layout
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingContainer(width: 300, height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ],
          ),
          SizedBox(height: 10),
          LoadingContainer(width: 300, height: 20) ,
          SizedBox(height: 5,),
          LoadingContainer(width: 300, height: 20) ,
          SizedBox(height: 5,),
          LoadingContainer(width: 300, height: 20) ,
          SizedBox(height: 5,),
          LoadingContainer(width: 300, height: 20) ,
          SizedBox(height: 10),
          Row(
            children: [
              LoadingContainer(width: 30, height: 30),
              SizedBox(width: 20),
              LoadingContainer(width: 80, height: 20)
            ],
          )
        ],
      ),
    );
  }
}
