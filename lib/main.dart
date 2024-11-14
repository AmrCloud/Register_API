import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_api/bloc/register_cubit.dart';
import 'package:register_api/bloc/text_field_bloc.dart';
import 'package:register_api/register_screen.dart';
import 'package:register_api/config/shared_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHandler().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Register App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider<RegisterCubit>(create: (_) => RegisterCubit()),
          BlocProvider<TextFieldCubit>(create: (_) => TextFieldCubit())
        ], child: RegisterScreen()));
  }
}
