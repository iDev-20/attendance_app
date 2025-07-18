import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_images.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool autofocus;
  final bool enabled;
  final VoidCallback onClear;

  const SearchTextFormField({
    super.key,
    this.controller,
    this.labelText = '',
    this.hintText = '',
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.autofocus = false,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.onSubmitted,
    this.enabled = true,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        autofocus: autofocus,
        cursorColor: AppColors.defaultColor,
        style: const TextStyle(
          color: AppColors.defaultColor,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 4, left: 10, right: 10),
          hintText: hintText ?? AppStrings.search,
          hintStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 36, maxWidth: 36),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 36, maxWidth: 36),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: AppImages.svgSearchIcon,
          ),
          suffixIcon: Visibility(
            visible: controller?.text.isNotEmpty ?? false,
            child: InkWell(
              onTap: onClear,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.cancel,
                  color: AppColors.grey,
                  size: 15.5,
                ),
              ),
            ),
          ),
        ),
        inputFormatters: inputFormatters,
        keyboardType: TextInputType.text,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }
}

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
  final TextCapitalization? textCapitalization;
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
      this.textCapitalization,
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
                        color: AppColors.defaultColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
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
              cursorColor: AppColors.defaultColor,
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
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 2.0),
                ),
              ),
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              onSaved: onSaved,
              textInputAction: textInputAction ?? TextInputAction.done,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPrimaryTextFormField extends StatelessWidget {
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

  const CustomPrimaryTextFormField(
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
          // Visibility(
          //   visible: labelText != null,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 6),
          //     child: Row(
          //       children: [
          //         Text(
          //           labelText ?? '',
          // style: const TextStyle(
          //     color: Colors.black,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w400),
          //         ),
          //         Visibility(
          //           visible: required,
          //           child: const Text(
          //             '*',
          //             style: TextStyle(
          //                 color: Color.fromRGBO(255, 54, 36, 0.5),
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w400),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 60,
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
                labelText: labelText ?? '',
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                hintText: hintText ?? '',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(166, 164, 164, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(6),
                //   borderSide: BorderSide(color: Colors.grey.shade700),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(6),
                //   borderSide: BorderSide(color: Colors.grey.shade700),
                // ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(4),
                //   borderSide: const BorderSide(color: Colors.black, width: 2.0),
                // ),
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
