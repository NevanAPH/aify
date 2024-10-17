import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:aify/utils/theme.dart';
import 'package:aify/utils/routes.dart';
import 'package:aify/env.gen.dart';

Future<void> main() async {

  // Set status bar color to transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aify',
      theme: AppTheme.getThemeData(),
      initialRoute: '/',
      getPages: pages,
      debugShowCheckedModeBanner: false,
    );
  }
}