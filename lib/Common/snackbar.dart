import 'package:flutter/material.dart';
import 'package:flutter_salam/Theme/theme.dart';

showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.snackbar,
  ));
}
