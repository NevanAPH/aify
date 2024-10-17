import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aify/controllers/auth_controller.dart';
import 'package:aify/controllers/menus_controller.dart';
import 'package:aify/utils/theme.dart';
import 'package:aify/widgets/button_widget.dart';
import 'package:aify/widgets/partials/auth_button.dart';
import 'package:aify/widgets/textfield_widget.dart';

class LoginPartialPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController auth = Get.find();
  final MenusController menu = Get.find();

  LoginPartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(48.0),
        child: Column(
          children: [
            Text(
              'Welcome back!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  'Enter email and password to sign in back to your account.',
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
            const SizedBox(height: 16.0),
            TextFieldWidget(
              'Password',
              error: auth.error2.value == "" ? null : auth.error2.value,
              disabled: auth.disable.value,
              controller: _passwordController,
              obscureText: auth.obscure.value,
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                  onPressed: () => auth.setObscure(!auth.obscure.value),
                  icon: Icon(auth.obscure.value
                      ? Icons.visibility
                      : Icons.visibility_off)),
            ),
            const SizedBox(height: 8),
            TextButton(
                onPressed:
                    auth.disable.value ? null : () => menu.setSelected(1),
                child: Text('Forgot password?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppTheme.hintColor))),
            const Spacer(),
            AuthButton(
                buttonOneText: 'Login',
                buttonOneVariant: ButtonVariant.outline,
                buttonOneOnPressed: () async {
                  // check if email and password is not empty
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    if (_emailController.text.isEmpty) {
                      auth.setError1("Email cannot be empty.");
                    }
                    if (_passwordController.text.isEmpty) {
                      auth.setError2("Password cannot be empty.");
                    }
                    return;
                  }

                  auth.setSubmitting(true);
                  menu.setLocked(true);

                  if (_emailController.text == "admin@email.com" &&
                      _passwordController.text == "admin") {
                    Get.offAllNamed('/');
                  } else {
                    auth.setError2("Invalid email or password.");
                  }

                  auth.setSubmitting(false);
                  menu.setLocked(false);
                },
                loading: auth.loading.value)
          ],
        ),
      ),
    );
  }
}
