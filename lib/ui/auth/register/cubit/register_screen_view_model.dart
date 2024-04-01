import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/ui/auth/register/cubit/states.dart';

import '../../../../domain/use_cases/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  //todo: hold data - handle logic
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'Amira');
  var passwordController = TextEditingController(text: '123456');
  var confirmationPasswordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text:'amira121@route.com');
  var phoneController = TextEditingController(text: '01212121212');
  bool isObscure = true;
  RegisterUseCase registerUseCase;

  void register() async {
    // register
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmationPasswordController.text,
        phoneController.text);
    either.fold((l) => emit(RegisterErrorState(errorMessage: l.errorMessage)),
        (response) => emit(RegisterSuccessState(authResultEntity: response)));
  }
}
