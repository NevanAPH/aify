import 'package:aify/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

List<GetPage> pages = [
  GetPage(
      name: '/',
      page: () {
        Future.delayed(const Duration(seconds: 0), () async {
          final supabase = Supabase.instance.client;
          if (supabase.auth.currentUser != null) {
            return Get.offAllNamed('/home');
          }
          return Get.offAllNamed('/welcome');
        });
        return const Scaffold();
      }),
  GetPage(
    name: '/welcome',
    page: () => const WelcomePage(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];
