// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:aify/widgets/button_widget.dart';

class AuthButton extends StatelessWidget {
  final String buttonOneText;
  final ButtonVariant buttonOneVariant;
  final VoidCallback buttonOneOnPressed;
  String? buttonTwoText;
  ButtonVariant? buttonTwoVariant;
  VoidCallback? buttonTwoOnPressed;
  bool? loading;

  AuthButton(
      {required this.buttonOneText,
      required this.buttonOneVariant,
      required this.buttonOneOnPressed,
      this.buttonTwoText,
      this.buttonTwoVariant,
      this.buttonTwoOnPressed,
      this.loading,
      super.key});

  @override
  Widget build(BuildContext context) {
    final Uri termsUri = Uri.parse('https://realzzy.xyz/?terms');
    final Uri privacyUri = Uri.parse('https://realzzy.xyz/?privacy');

    return Column(
      children: [
        ButtonWidget(buttonOneText,
            variant: buttonOneVariant,
            onPressed: buttonOneOnPressed,
            loading: loading),
        if (buttonTwoText != null &&
            buttonTwoVariant != null &&
            buttonTwoOnPressed != null)
          Column(
            children: [
              const SizedBox(height: 12.0),
              ButtonWidget(buttonTwoText!,
                  variant: buttonTwoVariant!,
                  onPressed: buttonTwoOnPressed!,
                  loading: loading),
            ],
          ),
        Container(
          constraints: const BoxConstraints(maxWidth: 300),
          margin: const EdgeInsets.only(top: 8.0),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'By continuing, you agreed to our ',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                        text: 'Terms',
                        recognizer: TapGestureRecognizer(),
                          // ..onTap = () async => await launchUrl(termsUri),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).primaryColorLight)),
                    const TextSpan(text: ' and '),
                    TextSpan(
                        text: 'Privacy Policy',
                        recognizer: TapGestureRecognizer(),
                          // ..onTap = () async => await launchUrl(privacyUri),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).primaryColorLight)),
                    const TextSpan(text: '.')
                  ])),
        ),
        GestureDetector()
      ],
    );
  }
}
