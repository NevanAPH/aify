// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:aify/utils/theme.dart';
import 'package:aify/widgets/spinner_widget.dart';

enum ButtonVariant { primary, secondary, warning, danger, outline }

class ButtonWidget extends StatelessWidget {
  final String text;
  final ButtonVariant variant;
  final VoidCallback onPressed;
  bool? loading;

  Color? backgroundColor;
  Color? foregroundColor;
  Widget? prefixIcon;
  double? borderWidth;
  Color? borderColor;
  double? borderRadius;
  FontWeight? fontWeight;
  EdgeInsetsGeometry? padding;
  double? width;

  ButtonWidget(this.text,
      {required this.variant,
      required this.onPressed,
      this.loading,
      this.backgroundColor,
      this.foregroundColor,
      this.borderWidth,
      this.borderColor,
      this.borderRadius,
      this.fontWeight,
      this.padding,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    final data = variantCheck();
    if (backgroundColor != null) data.backgroundColor = backgroundColor;
    if (foregroundColor != null) data.foregroundColor = foregroundColor;
    if (borderWidth != null) data.borderWidth = borderWidth;
    if (borderColor != null) data.borderColor = borderColor;
    if (borderRadius != null) data.borderRadius = borderRadius;
    if (fontWeight != null) data.fontWeight = fontWeight;

    return CustomButtonWidget(text,
        onPressed: onPressed,
        backgroundColor: data.backgroundColor,
        foregroundColor: data.foregroundColor,
        borderWidth: data.borderWidth,
        borderColor: data.borderColor,
        borderRadius: data.borderRadius,
        fontWeight: data.fontWeight,
        padding: padding,
        width: width,
        loading: loading);
  }

  variantCheck() {
    switch (variant) {
      case ButtonVariant.secondary:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.secondaryColorDark,
            foregroundColor: AppTheme.textPrimaryColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);

      case ButtonVariant.warning:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.warningColorDark,
            foregroundColor: AppTheme.textPrimaryColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);

      case ButtonVariant.danger:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.errorColorDark,
            foregroundColor: AppTheme.textPrimaryColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);

      case ButtonVariant.outline:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: Colors.transparent,
            foregroundColor: AppTheme.white100,
            borderWidth: 3.0,
            borderColor: AppTheme.white90,
            borderRadius: 100.0,
            fontWeight: FontWeight.w500);

      default:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.primaryColorDark,
            foregroundColor: AppTheme.textPrimaryColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);
    }
  }
}

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool? loading = false;

  Color? backgroundColor = AppTheme.primaryColorDark;
  Color? foregroundColor = AppTheme.textPrimaryColor;
  double? borderWidth;
  Color? borderColor;
  double? borderRadius = 100.0; // fully rounded
  FontWeight? fontWeight = FontWeight.w500;
  EdgeInsetsGeometry? padding;
  double? width;

  CustomButtonWidget(this.text,
      {required this.onPressed,
      this.loading,
      this.backgroundColor,
      this.foregroundColor,
      this.borderWidth,
      this.borderColor,
      this.borderRadius,
      this.fontWeight,
      this.padding,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading == true ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.primaryColorDark,
        foregroundColor: foregroundColor ?? AppTheme.textPrimaryColor,
        side: BorderSide(
            color: borderColor ?? backgroundColor!, width: borderWidth ?? 0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100.0)),
        minimumSize: Size(width ?? double.infinity, 0),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: loading == true
          ? const SpinnerWidget(size: SpinnerSize.small)
          : Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: fontWeight ?? FontWeight.w500),
            ),
    );
  }
}
