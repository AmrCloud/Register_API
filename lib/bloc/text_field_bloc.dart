import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldCubit extends Cubit<Map<String, String?>> {
  TextFieldCubit() : super({});

  void validateField(String fieldName, String value) {
    String? error;

    if (fieldName == 'email') {
      if (value.isEmpty) {
        error = 'Email is required';
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        error = 'Enter a valid email';
      }
    } else if (fieldName == 'password') {
      if (value.isEmpty) {
        error = 'Password is required';
      } else if (value.length < 6) {
        error = 'Password must be at least 6 characters';
      }
    }

    emit({
      ...state,
      fieldName: error,
    });
  }

  void clearError(String fieldName) {
    emit({
      ...state,
      fieldName: null,
    });
  }
}
