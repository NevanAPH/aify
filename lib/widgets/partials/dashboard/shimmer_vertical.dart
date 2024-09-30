import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:aify/utils/theme.dart';

class ShimmerVertical extends StatelessWidget {
  const ShimmerVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.backgroundLightColor,
      highlightColor: const Color.fromARGB(255, 23, 23, 56),
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 88,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color:
                  AppTheme.backgroundLightColor.withOpacity(1 - (index * 0.2)),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}
