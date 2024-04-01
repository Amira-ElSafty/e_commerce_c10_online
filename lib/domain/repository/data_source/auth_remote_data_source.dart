import 'package:dartz/dartz.dart';
import '../../entities/AuthResultEntity.dart';
import '../../entities/failurs.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,AuthResultEntity>> register(String name , String email , String password,
      String rePassword, String phone);

  Future<Either<Failures,AuthResultEntity>> login(String email , String password);

}