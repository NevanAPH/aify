import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import pages
import 'package:aify/pages/welcome_page.dart';
import 'package:aify/pages/auth/login_page.dart';
import 'package:aify/pages/auth/register_page.dart';
import 'package:aify/pages/dashboard_page.dart';

// Import bindings
import 'package:aify/bindings/auth_bindings.dart';
import 'package:aify/bindings/dash_bindings.dart';

List<GetPage> pages = [
  GetPage(
      name: '/',
      page: () {
        Future.delayed(const Duration(seconds: 0), () async {
          // if (supabase.auth.currentUser != null) {
          //   return Get.offAllNamed('/home');
          // }
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
  GetPage(
    name: '/auth/login',
    page: () => LoginPage(),
    binding: AuthBindings()
  ),
  GetPage(
    name: '/auth/register',
    page: () => const RegisterPage(),
    binding: AuthBindings()
  ),
  GetPage(
    name: '/home',
    page: () => DashboardPage(),
    binding: DashBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),
  )
];
