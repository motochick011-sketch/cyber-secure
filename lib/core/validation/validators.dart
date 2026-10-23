import 'package:regexpattern/regexpattern.dart';

abstract final class Validators {
  static bool isEmail(String email) => email.isEmail() && email.isNotEmpty;

  static String? email(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Email is required';
    if (!isEmail(v)) return 'Enter a valid email';
    return null;
  }

  static String? password(String? value, {int minLength = 8}) {
    final v = value ?? '';
    if (v.isEmpty) return 'Password is required';
    if (v.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if ((value ?? '').isEmpty) return 'Please confirm your password';
    if (value != original) return 'Passwords do not match';
    return null;
  }

  static final RegExp _passwordRegExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,})");

  static bool isValidEmail(String email) {
    return email.isEmail() && email.isNotEmpty;
  }

  static bool isValidPassword(String password) {
    if (password.isNotEmpty) return _passwordRegExp.hasMatch(password);
    return false;
  }
}
