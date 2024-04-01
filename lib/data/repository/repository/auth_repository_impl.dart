import 'package:dartz/dartz.dart';
import '../../../domain/entities/AuthResultEntity.dart';
import '../../../domain/entities/failurs.dart';
import '../../../domain/repository/data_source/auth_remote_data_source.dart';
import '../../../domain/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

}