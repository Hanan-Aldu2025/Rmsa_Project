import 'package:appp/generated/l10n.dart';
import 'package:flutter/material.dart';

class AuthValidators {
  // Full Name Validation
  static String? name(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).enterFullName;
    }
    return null;
  }

  // Email Validation
  static String? email(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).enterEmail;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return S.of(context).invalidEmail;
    }
    return null;
  }

  // Password Validation
  static String? password(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).enterPassword;
    }
    if (value.length < 6) {
      return S.of(context).passwordTooShort;
    }
    return null;
  }
}
