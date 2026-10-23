import 'package:flutter/material.dart';
import 'package:cybersecure/core/validation/validators.dart';

class AppEmailTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String labelText;
  final bool isEnabled;

  const AppEmailTextField({super.key, required this.controller, required this.onChanged, this.labelText = 'Email', this.isEnabled = true});

  @override
  State<AppEmailTextField> createState() => _AppEmailTextFieldState();
}

class _AppEmailTextFieldState extends State<AppEmailTextField> {
  String? validateEmail(String? value) {
    return !Validators.isValidEmail(value ?? '') ? 'Enter a valid email address' : null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: validateEmail,
      decoration: InputDecoration(
        labelText: widget.labelText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        isDense: true,
        filled: true,
        hintText: 'example@test.com',
      ),
      enabled: widget.isEnabled,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      onChanged: widget.onChanged,
      textAlign: TextAlign.start,
      readOnly: false,
    );
  }
}
