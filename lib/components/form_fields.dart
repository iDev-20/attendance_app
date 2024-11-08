import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool required;
  final bool autofocus;
  final bool enabled;
  final void Function(String?)? onSaved;

  const PrimaryTextFormField(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.prefixWidget,
      this.suffixWidget,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.keyboardType,
      this.textInputAction,
      this.maxLines = 1,
      this.autofocus = false,
      this.maxLength,
      this.obscureText = false,
      this.onTap,
      this.enabled = true,
      this.required = false,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: labelText != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Text(
                    labelText ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Visibility(
                    visible: required,
                    child: const Text(
                      '*',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 54, 36, 0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: TextFormField(
              autofocus: autofocus,
              obscureText: obscureText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: prefixWidget,
                filled: true,
                fillColor: Colors.grey.shade300,
                suffixIcon: suffixWidget,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                hintText: hintText ?? '',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(166, 164, 164, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              onSaved: onSaved,
            ),
          ),
        ],
      ),
    );
  }
}
