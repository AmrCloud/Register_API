import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static const String registerUrl =
      'https://coursafer.innoeg.com/api/auth/register';

  void registerUser(String username, String email, String mobile,
      String password, String passwordConfirmation) async {
    emit(RegisterLoading());
    final Dio dio = Dio(
      BaseOptions(headers: {"Accept": "application/json"}),
    );
    try {
      final response = await dio.post(registerUrl, data: {
        'username': username,
        'email': email,
        'mobile': mobile,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RegisterSuccess());
      } else {
        print("Error response: ${response.data}");
        emit(RegisterError('Failed with status: ${response.statusCode}'));
      }
    } catch (e) {
      print("Exception: $e");
      emit(RegisterError(e.toString()));
    }
  }
}
