import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aify/controllers/auth_controller.dart';
import 'package:aify/controllers/menus_controller.dart';
import 'package:aify/pages/partials/auth/login_partial.dart';
import 'package:aify/pages/partials/auth/sendreset_partial.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final MenusController menu = Get.find();
  final AuthController auth = Get.find();

  final params = Get.parameters;
  final List<Widget> _pages = [LoginPartialPage(), SendresetPartialPage()];

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    menu.selected.listen((value) {
      if (menu.locked.value) return;
      auth.clear();
      controller.animateToPage(value,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    });

    if (params.containsKey('selected')) {
      menu.setSelected(int.parse(params['selected']!));
    }

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
      Expanded(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller, 
          children: _pages
        ),
      ),
      Obx(() => PopScope(
            canPop: !menu.locked.value && menu.selected.value == 0,
            child: const SizedBox(),
            onPopInvokedWithResult: (didPop, result) {
              if (menu.selected.value != 0 && !menu.locked.value) {
                menu.setSelected(menu.selected.value - 1);
              }
            },
          ))
    ]));
  }
}
