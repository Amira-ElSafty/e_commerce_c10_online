import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/data/api/ApiManager.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/data_source/home_tab_remote_data_source.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  ApiManager apiManager;

  HomeTabRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories() async {
    var either = await apiManager.getCategories();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands()async {
    var either = await apiManager.getBrands();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts()async {
    var either = await apiManager.getProducts();
    return either.fold((l) {
      return Left(l);
    },
            (response) {
      return Right(response);
            });
  }
}
