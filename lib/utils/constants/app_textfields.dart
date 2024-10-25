import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? submitFun;
  final List<TextInputFormatter>? textInputFormatter;
  final Icon? icon;
  final Icon? prefixIcon;
  final int? maxLengths;
  final bool? isEnabled;
  final bool obscureText;

  const Inputfield({
    this.textInputFormatter,
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.icon,
    this.prefixIcon,
    this.maxLengths,
    this.submitFun,
    this.isEnabled,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: submitFun,
      inputFormatters: textInputFormatter,
      maxLength: maxLengths, // Use maxLength instead of maxLines
      style: const TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      validator: validator,
      obscureText: obscureText, // Corrected placement of obscureText
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(82, 136, 132, 136)),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(54, 38, 8, 37)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(54, 62, 5, 61)),
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade600),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade600),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hinttext,
        prefixIcon: prefixIcon != null
            ?Container(
          // Wrap the Row in a container to set the height
          height: 16, // Adjust this value as needed
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              prefixIcon!, // Safe to use ! since we checked for null
              const VerticalDivider(
                color: Colors.grey, // Set your preferred color here
                thickness: 2, // Divider thickness
                width: 9,  // Spacing between icon and divider
              ),
            ],
          ),
        ):Container(height: 0,),
        suffixIcon: icon,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 124, 114, 114)),
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}

class InputfieldLogin extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? submitFun;
  final List<TextInputFormatter>? textInputFormatter;
  final IconButton? icon;
  final Icon? prefixIcon;
  final int? maxLengths;
  final bool? isEnabled;
  final bool obscureText;

  const InputfieldLogin({
    this.textInputFormatter,
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.icon,
    this.prefixIcon,
    this.maxLengths,
    this.submitFun,
    this.isEnabled,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: submitFun,
      inputFormatters: textInputFormatter,
      maxLength: maxLengths, // Use maxLength instead of maxLines
      style: const TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      validator: validator,
      obscureText: obscureText, // Corrected placement of obscureText
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(82, 136, 132, 136)),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(54, 38, 8, 37)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(54, 62, 5, 61)),
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade600),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade600),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hinttext,
        prefixIcon: prefixIcon,
        suffixIcon: icon,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 124, 114, 114)),
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
