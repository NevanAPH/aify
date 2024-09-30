// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:aify/utils/theme.dart';

class TextFieldWidget extends StatelessWidget {
  
  final String label;
  final TextEditingController controller;

  bool? obscureText = false;
  bool? disabled = false;
  String? error;
  TextInputType? keyboardType = TextInputType.text;

  Widget? prefixIcon;
  Widget? suffixIcon;

  Color? backgroundColor = Colors.transparent;
  Color? foregroundColor = AppTheme.white90;
  Color? hintColor = AppTheme.white50;
  Color? errorColor = AppTheme.errorColor;
  Color? iconColor = AppTheme.white100;
  Color? borderColor = AppTheme.white30;
  Color? cursorColor = AppTheme.primaryColor;
  double? borderWidth = 2.0;
  double? borderRadius = 8.0;

  TextFieldWidget(
    this.label, 
    {
      required this.controller,
      this.obscureText,
      this.keyboardType,
      this.disabled,
      this.error,
      this.prefixIcon,
      this.suffixIcon,
      this.backgroundColor,
      this.foregroundColor,
      this.hintColor,
      this.errorColor,
      this.iconColor,
      this.borderColor,
      this.borderWidth,
      this.borderRadius,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: keyboardType,
      enabled: disabled != null ? disabled != true : true,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: hintColor ?? AppTheme.white50),
        errorText: error,
        errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: errorColor ?? AppTheme.errorColor),
        prefixIcon: prefixIcon != null ? 
          Padding(padding: const EdgeInsets.only(left: 4), child: prefixIcon) : null,
        suffixIcon: suffixIcon != null ? 
          Padding(padding: const EdgeInsets.only(right: 4), child: suffixIcon) : null,
        prefixIconColor: iconColor ?? AppTheme.white100,
        suffixIconColor: iconColor ?? AppTheme.white100,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppTheme.white30, width: borderWidth ?? 2.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppTheme.white30, width: borderWidth ?? 2.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0)
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppTheme.white30, width: borderWidth ?? 2.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor ?? AppTheme.errorColor, width: borderWidth ?? 2.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0)
        ),
        filled: backgroundColor != null && backgroundColor != Colors.transparent,
        fillColor: backgroundColor,
      ),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: foregroundColor ?? AppTheme.white100),
      cursorColor: cursorColor ?? AppTheme.primaryColor,
    );
  }
}