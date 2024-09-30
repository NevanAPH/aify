import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryPartialPage extends StatelessWidget {
  const LibraryPartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(minHeight: Get.height),
        alignment: Alignment.center,
        child: const Text('Library Partial Page'),
      ),
    );
  }
}