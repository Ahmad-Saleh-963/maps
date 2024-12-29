import 'package:flutter/material.dart';
import 'package:sport/library/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.label,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.fontSize = 18,
    this.prefix,
    this.height = 60,
    this.isEnable = true,
    this.textAlign = TextAlign.right,
    this.maxLines,
    this.error,
    this.fillColor = Colors.transparent,
    this.showBorder = true,
  });

  final TextEditingController controller;
  final String? label;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final double? fontSize;
  final double? height;
  final Color? fillColor;
  final Widget? prefix;
  final int? maxLines;
  final bool isEnable;
  final TextAlign? textAlign;
  final bool showBorder;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.right,
      controller: controller,
      textDirection: TextDirection.rtl,
      maxLines: maxLines,
      enabled: isEnable,
      style: TextStyle(height: 1, fontSize: fontSize),
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: prefix,
        filled: true,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        fillColor: fillColor,
        focusColor: Colors.white,
        hintTextDirection: TextDirection.rtl,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: showBorder
              ? BorderSide(color: ColorsApp.primaryColor, width: 1.0)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: showBorder
              ? BorderSide(color: ColorsApp.primaryColor, width: 1.0)
              : BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: showBorder
              ? const BorderSide(color: Colors.red, width: 1.0)
              : BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        error: error == null
            ? null
            : Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "$error",
                  style: TextStyle(height: 0.8, color: Colors.red.shade700,fontSize: 13),
                ),
              ),
        errorStyle: const TextStyle(
          fontSize: 12,
          color: Colors.red,
          textBaseline: TextBaseline.alphabetic,
        ),
        errorMaxLines: 2,
      ),
      onChanged: (txt) {
        if (onChange != null) {
          onChange!(txt);
        }
      },
    );
  }
}
