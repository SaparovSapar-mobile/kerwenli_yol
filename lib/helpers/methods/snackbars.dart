import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String text) {
  return AnimatedSnackBar.material(
    text,
    type: AnimatedSnackBarType.error,
    duration: const Duration(seconds: 3),
  ).show(context);
}

void showSuccessSnackbar(BuildContext context, String text) {
  return AnimatedSnackBar.material(
    text,
    type: AnimatedSnackBarType.success,
    duration: const Duration(seconds: 3),
  ).show(context);
}
