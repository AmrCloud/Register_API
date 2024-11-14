import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_api/bloc/text_field_bloc.dart';
import 'package:register_api/modules/text_field_module.dart';

class RegisterCustomTextField extends StatelessWidget {
  final TextFieldModule textFieldModule;
  const RegisterCustomTextField({super.key, required this.textFieldModule});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldCubit, Map<String, String?>>(
      builder: (context, state) {
        String? errorMessage = state[textFieldModule.fieldName];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: textFieldModule.controller,
              keyboardType: textFieldModule.keyboardType,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: textFieldModule.hintText,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                suffixIcon: textFieldModule.iconWidget,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: errorMessage != null ? Colors.red : Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: errorMessage != null ? Colors.red : Colors.grey,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                errorText: errorMessage,
              ),
              onChanged: (value) {
                context
                    .read<TextFieldCubit>()
                    .validateField(textFieldModule.fieldName, value);
              },
            ),
          ],
        );
      },
    );
  }
}
