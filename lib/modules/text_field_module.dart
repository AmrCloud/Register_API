import 'package:flutter/material.dart';

class TextFieldModule {
  final TextEditingController controller;
  final String fieldName;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? iconWidget;

  TextFieldModule({
    required this.controller,
    required this.fieldName,
    required this.hintText,
    required this.keyboardType,
    this.iconWidget,
  });
}
