import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  final double width;
  final double height;

  const LoadingContainer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.background,
      highlightColor: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20) ,
              color: Theme.of(context).colorScheme.background,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
