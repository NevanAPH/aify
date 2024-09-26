import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aify/controllers/auth_controller.dart';
import 'package:aify/controllers/menus_controller.dart';
import 'package:aify/widgets/button_widget.dart';
import 'package:aify/widgets/partials/auth_button.dart';
import 'package:aify/widgets/textfield_widget.dart';

class SendresetPartialPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final AuthController auth = Get.find();
  final MenusController menu = Get.find();

  SendresetPartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(48.0),
        child: Column(
          children: [
            Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  'Enter email associated with your account to send password reset.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
            const SizedBox(height: 48),
            TextFieldWidget(
              'Email address',
              error: auth.error1.value == "" ? null : auth.error1.value,
              disabled: auth.disable.value,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
            ),
            
            const Spacer(),
            AuthButton(
                buttonOneText: 'Send Password Reset',
                buttonOneVariant: ButtonVariant.outline,
                buttonOneOnPressed: () async {
                  if (_emailController.text.isEmpty) return auth.setError1("Email cannot be empty.");

                  auth.setSubmitting(true);
                  menu.setLocked(true);

                  await Future.delayed(const Duration(seconds: 3));
                  auth.setSubmitting(false);
                  menu.setLocked(false);

                  auth.setError1("Something wrong has occured.\nPlease contact support for help.");
                },
                loading: auth.loading.value)
          ],
        ),
      ),
    );
  }
}
