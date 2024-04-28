import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/data_source/home_tab_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/home_tab_repositoy.dart';

class HomeTabRepositoryImpl implements HomeRepository{
  HomeTabRemoteDataSource remoteDataSource ;
  HomeTabRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands() {
    return remoteDataSource.getBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return remoteDataSource.getProducts();
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) {
    return remoteDataSource.addToCart(productId);
  }

}