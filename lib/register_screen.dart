import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_api/bloc/text_field_bloc.dart';
import 'package:register_api/modules/text_field_module.dart';
import 'package:register_api/register_custom_text.dart';
import 'bloc/register_cubit.dart';
import 'config/shared_handler.dart';
import 'bloc/register_state.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            SharedHandler().setData('username', usernameController.text);
            SharedHandler().setData('email', emailController.text);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration successful')),
            );
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              RegisterCustomTextField(
                textFieldModule: TextFieldModule(
                  controller: usernameController,
                  fieldName: 'name',
                  hintText: 'Enter Username',
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RegisterCustomTextField(
                textFieldModule: TextFieldModule(
                  controller: emailController,
                  fieldName: 'email',
                  hintText: 'Enter Your Email',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RegisterCustomTextField(
                textFieldModule: TextFieldModule(
                  controller: mobileController,
                  fieldName: 'phone',
                  hintText: 'Enter Phone Number',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RegisterCustomTextField(
                textFieldModule: TextFieldModule(
                  controller: passwordController,
                  fieldName: 'password',
                  hintText: 'Create Password',
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RegisterCustomTextField(
                textFieldModule: TextFieldModule(
                  controller: confirmPasswordController,
                  fieldName: 'confirm_password',
                  hintText: 'Confirm Your Password',
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<RegisterCubit>(context).registerUser(
                    usernameController.text,
                    emailController.text,
                    mobileController.text,
                    passwordController.text,
                    confirmPasswordController.text,
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
