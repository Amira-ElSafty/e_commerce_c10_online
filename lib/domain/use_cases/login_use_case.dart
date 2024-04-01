import 'package:dartz/dartz.dart';
import '../entities/AuthResultEntity.dart';
import '../entities/failurs.dart';
import '../repository/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepository authRepository ;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String email,String password){
    return authRepository.login(email, password);
  }

}