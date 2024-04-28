import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';

abstract class HomeRepository{
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getBrands();
  Future<Either<Failures,ProductResponseEntity>> getProducts();
  Future<Either<Failures,AddCartResponseEntity>> addToCart(String productId);

}