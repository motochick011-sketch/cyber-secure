import 'package:flutter/material.dart';
import 'package:cybersecure/core/validation/validators.dart';

class AppPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String value, bool isValid) onChanged;
  final bool isConfirmPassword;
  final TextEditingController? passwordController;
  final String? labelText;
  final bool validate;
  final String? invalidText;
  final FocusNode? focusNode;

  const AppPasswordTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.isConfirmPassword = false,
    this.passwordController,
    this.labelText,
    this.validate = true,
    this.invalidText,
    this.focusNode,
  });

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool _obscuredPassword = true;
  String? _errorText;

  @override
  void initState() {
    if (widget.controller.text.isEmpty) _errorText = 'Required';
    super.initState();
  }

  void validatePassword() {
    bool isValid = true;
    _errorText = null;
    if (widget.controller.text.isEmpty) {
      _errorText = 'Required';
      isValid = false;
    }
    if (widget.isConfirmPassword && widget.controller.text != widget.passwordController?.text && widget.validate) {
      _errorText = 'Passwords don\'t match';
      isValid = false;
    }
    if (widget.controller.text.isNotEmpty && !Validators.isValidPassword(widget.controller.text) && widget.validate) {
      _errorText = widget.invalidText ?? 'Invalid Password';
      isValid = false;
    }
    widget.onChanged(widget.controller.text, isValid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        errorText: _errorText,
        suffixIcon: IconButton(onPressed: () => setState(() => _obscuredPassword = !_obscuredPassword), icon: Icon(_obscuredPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined)),
        labelText: widget.labelText ?? (widget.isConfirmPassword ? 'Confirm Password' : 'Password'),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        isDense: true,
        filled: true,
      ),
      obscureText: _obscuredPassword,
      autocorrect: false,
      onChanged: (_) => validatePassword(),
      textAlign: TextAlign.start,
      enabled: true,
      keyboardType: TextInputType.text,
    );
  }
}
