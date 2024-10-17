import 'package:aify/controllers/creations_controller.dart';
import 'package:aify/utils/theme.dart';
import 'package:aify/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePartialPage extends StatelessWidget {
  ProfilePartialPage({super.key});

  final CreationsController creations = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 120,
                        height: 120,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.white90,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 88,
                          color: AppTheme.backgroundColor,
                        )),
                    const SizedBox(height: 16),
                    Text(
                      getFullName(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Text(
                      '38 Contents ・ PRO'
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                child: ButtonWidget('Logout', variant: ButtonVariant.danger,
                  onPressed: () async {
                Get.offAllNamed('/welcome');
              }),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getFullName() {
    // final metadata = supabase.auth.currentUser!.userMetadata;
    // if (metadata != null &&
    //     metadata.containsKey('first_name') &&
    //     metadata.containsKey('last_name')) {
    //   return "${metadata['first_name'] as String} ${metadata['last_name'] as String}";
    // }
    return "Unknown Name";
  }
}
