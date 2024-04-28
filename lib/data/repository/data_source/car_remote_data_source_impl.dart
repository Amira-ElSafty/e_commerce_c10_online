import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/data/api/ApiManager.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/data_source/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  ApiManager apiManager ;
  CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart()async {
    var either = await apiManager.getCart();
    return either.fold((l) {
      return Left(l);
    },
            (response) {
      return Right(response);
            });
  }
  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart
      (String productId) async {
    var either = await apiManager.deleteItemInCart(productId);
    return either.fold((l) {
      return Left(l);
    },
            (response) {
          return Right(response);
        });
  }
  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart
      (int count,String productId)async {
    var either = await apiManager.updateCountInCart(count,productId);
    return either.fold((l) {
      return Left(l);
    },
            (response) {
          return Right(response);
        });
  }

}
