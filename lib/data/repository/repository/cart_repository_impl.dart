import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource cartRemoteDataSource ;
  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId) {
   return cartRemoteDataSource.deleteItemInCart(productId);
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      int count,String productId) {
    return cartRemoteDataSource.updateCountInCart(count,productId);
  }

}