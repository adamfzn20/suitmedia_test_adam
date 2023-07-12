import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputAction textInputAction;

  const CustomTextFormField({
    super.key,
    required this.textInputAction,
    required this.hint,
    required this.validator,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.only(left: 20.0),
        helperStyle: Theme.of(context).textTheme.bodySmall,
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Colors.black38,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: widget.validator != null
          ? (value) {
              setState(() {});
              return widget.validator!(value);
            }
          : null,
    );
  }
}
