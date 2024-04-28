import 'package:dartz/dartz.dart';
import '../../entities/GetCartResponseEntity.dart';
import '../../entities/failurs.dart';

abstract class CartRemoteDataSource{
  Future<Either<Failures,GetCartResponseEntity>> getCart();
  Future<Either<Failures,GetCartResponseEntity>> deleteItemInCart(String productId);
  Future<Either<Failures,GetCartResponseEntity>> updateCountInCart(
      int count,String productId);

}