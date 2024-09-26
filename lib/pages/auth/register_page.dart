import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aify/widgets/spinner_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            'assets/images/backgrounds/glow_header.png',
            width: Get.width,
          ),
          Positioned(
            top: Get.width * 0.16,
            child: SvgPicture.asset(
              'assets/icons/default/account.svg',
              width: 108,
            ),
          ),
        ],
      ),
      Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(minHeight: Get.height - 280),
        child: const SpinnerWidget(size: SpinnerSize.medium),
      )
    ]));
  }
}
