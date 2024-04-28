import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';

abstract class CartRepository{
  Future<Either<Failures,GetCartResponseEntity>> getCart();
  Future<Either<Failures,GetCartResponseEntity>> deleteItemInCart(String productId);
  Future<Either<Failures,GetCartResponseEntity>> updateCountInCart(
      int count,String productId);
}