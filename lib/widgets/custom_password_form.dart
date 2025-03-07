import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatefulWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final TextInputType? keyboardType;
  final String formProperty;
  final Map<String, String> formValues;
  final TextEditingController? controller;

  const CustomPasswordFormField({
    super.key,
    this.hintText,
    this.helperText,
    this.labelText,
    this.keyboardType,
    required this.formProperty,
    required this.formValues,
    this.controller,
  });

  @override
  _CustomPasswordFormFieldState createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      onChanged: (value) => widget.formValues[widget.formProperty] = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }

        if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return 'Debe contener al menos una mayúscula';
        }

        if (!RegExp(r'[0-9]').hasMatch(value)) {
          return 'Debe contener al menos un número';
        }

        if (value.length < 8) {
          return 'Mínimo 8 caracteres';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
