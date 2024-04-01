//todo: viewModel => object useCase
//todo: useCase => object repository
//todo: repository => object dataSource
//todo: dataSource =>object apiManager
import '../data/api/ApiManager.dart';
import '../data/repository/data_source/auth_remote_data_source_impl.dart';
import '../data/repository/repository/auth_repository_impl.dart';
import 'repository/data_source/auth_remote_data_source.dart';
import 'repository/repository/auth_repository.dart';
import 'use_cases/login_use_case.dart';
import 'use_cases/register_use_case.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepository: injectAuthRepository());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authRepository: injectAuthRepository());
}
AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}