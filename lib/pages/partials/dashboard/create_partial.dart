// ignore_for_file: must_be_immutable

import 'package:aify/widgets/button_widget.dart';
import 'package:aify/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:aify/controllers/creations_controller.dart';
import 'package:aify/controllers/menus_controller.dart';

class CreatePartialPage extends StatelessWidget {
  final MenusController menu = Get.find();
  final CreationsController creations = Get.find();

  final TextEditingController controller = TextEditingController();
  CreatePartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width, minHeight: Get.height),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: Get.height,
              child: Image.asset('assets/images/backgrounds/album_banner.png',
                width: Get.width, fit: BoxFit.contain),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 40),
                      child: SvgPicture.asset(
                        'assets/icons/white/spark.svg',
                        width: 120,
                        height: 120,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 48),
                    child: Text(
                      'Make your own music',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    constraints: const BoxConstraints(maxWidth: 380),
                    child: Text(
                      'Creativity is only your limit. Create your own music and share it with the world!',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 350),
                    child: Column(
                      children: [
                        TextFieldWidget('Put your prompt here...',
                            controller: controller),
                        const SizedBox(height: 48),
                        ButtonWidget('Create Now',
                            variant: ButtonVariant.outline, onPressed: () {})
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
