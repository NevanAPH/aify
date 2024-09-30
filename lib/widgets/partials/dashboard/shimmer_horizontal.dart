import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:aify/utils/theme.dart';

class ShimmerHorizontal extends StatelessWidget {
  const ShimmerHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Shimmer.fromColors(
          baseColor: AppTheme.backgroundLightColor,
          highlightColor: const Color.fromARGB(255, 23, 23, 56),
          child: Row(
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 16),
                width: 260,
                height: 160,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundLightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}