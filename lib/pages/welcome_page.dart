import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aify/widgets/button_widget.dart';
import 'package:aify/widgets/partials/auth_button.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';

/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

     This part of code contains workaround
     That may hard to understand. Its not
     ChatGPT though. Confused counter: 01

   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Used to make sure render started only after rive loaded
    return FutureBuilder<Rive>(
      future: _loadRiveArtboard(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _render(context, snapshot.data);
        }
        return const Scaffold();
      },
    );
  }

  // Function to actually render the page
  Widget _render(context, rive) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(
        children: [
          SizedBox(height: Get.width * 1.4),
          SizedBox(width: Get.width, height: Get.width * 1.25, child: rive),
          Positioned(
              top: Get.width * 0.92,
              width: Get.width,
              child: _fadeIn(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Text(
                      'Where New',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Enjoys Begin',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(height: 0.7),
                    ),
                    Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        margin: const EdgeInsets.only(top: 32),
                        child: Text(
                          'Welcome! Please sign in first to continue access to this app.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ))
                  ])))
        ],
      ),
      const Spacer(),
      _fadeIn(
          delay: 1000,
          child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 48.0, horizontal: 48.0),
              child: AuthButton(
                buttonOneText: 'Create Account',
                buttonOneVariant: ButtonVariant.primary,
                buttonOneOnPressed: () => Get.toNamed('/auth/register'),
                buttonTwoText: 'Login',
                buttonTwoVariant: ButtonVariant.outline,
                buttonTwoOnPressed: () => Get.toNamed('/auth/login'),
              )))
    ]));
  }

  FutureBuilder _fadeIn({int delay = 0, required Widget child}) {
    // Fade in animation with customizable delay
    return FutureBuilder<dynamic>(
      future: Future.delayed(Duration(milliseconds: delay)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final widget = PlayAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween(begin: -1.0, end: 1.0),
              builder: (context, value, child) =>
                  Opacity(opacity: value < 0 ? 0 : value, child: child),
              child: child);
          return widget;
        }
        return const SizedBox();
      },
    );
  }

  // Load rive animation widget
  Future<Rive> _loadRiveArtboard() async {
    RiveFile.initialize();
    final file =
        RiveFile.import(await rootBundle.load('assets/animations/welcome.riv'));

    final artboard = file.mainArtboard;
    final idle = StateMachineController.fromArtboard(artboard, 'Idle')!;
    final start = StateMachineController.fromArtboard(artboard, 'Start')!;

    start.isActive = false;
    artboard.addController(idle);
    artboard.addController(start);

    // Simulate wait until all rendered
    Future.delayed(const Duration(milliseconds: 0), () {
      idle.isActive = false;
      start.isActive = true;
      idle.dispose();
    });

    // Note to Rive devs: Fix optimization for this widget pls on debug mode
    return Rive(artboard: artboard, fit: BoxFit.contain);
  }
}
