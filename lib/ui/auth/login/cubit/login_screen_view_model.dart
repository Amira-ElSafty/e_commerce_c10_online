import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/ui/auth/login/cubit/states.dart';

import '../../../../domain/use_cases/login_use_case.dart';
class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());
  LoginUseCase loginUseCase;
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: 'amira121@route.com');
  bool isObscure = true;

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((l) => emit(LoginErrorState(errorMessage: l.errorMessage)),
        (response) => emit(LoginSuccessState(authResultEntity: response)));
  }
}
