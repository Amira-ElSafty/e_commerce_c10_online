//todo: viewModel => object useCase
//todo: useCase => object repository
//todo: repository => object dataSource
//todo: dataSource =>object apiManager
import 'package:flutter_e_commerce_c10_online/data/repository/data_source/home_tab_remote_data_source_impl.dart';
import 'package:flutter_e_commerce_c10_online/data/repository/repository/home_tab_repository_impl.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/data_source/home_tab_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/home_tab_repositoy.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_all_products_use_case.dart';

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
GetAllCategoriesUseCase injectGetAllCategoriesUseCase(){
  return GetAllCategoriesUseCase(homeTabRepository:injectHomeRepository() );
}
GetAllBrandsUseCase injectGetAllBrandsUseCase(){
  return GetAllBrandsUseCase(homeTabRepository:injectHomeRepository() );
}
GetAllProductsUseCase injectGetAllProductsUseCase(){
  return GetAllProductsUseCase(homeTabRepository:injectHomeRepository() );
}
HomeTabRepository injectHomeRepository(){
  return HomeTabRepositoryImpl(remoteDataSource: injectHomeTabRemoteDataSource());
}
HomeTabRemoteDataSource injectHomeTabRemoteDataSource(){
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}