import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math';

enum SpinnerSize { small, medium, large }
class SpinnerWidget extends StatelessWidget {

  final SpinnerSize size;

  const SpinnerWidget({
    super.key,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 2 * pi),
      builder: (context, value, _) {
        return Transform.rotate(
          angle: value,
          child: SvgPicture.asset(
            'assets/icons/spinner.svg',
            width: size == SpinnerSize.small ? 30 : size == SpinnerSize.medium ? 60 : 80
          )
        );
      }
    );
  }
}