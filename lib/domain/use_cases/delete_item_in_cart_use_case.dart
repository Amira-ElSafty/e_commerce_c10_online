import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/cart_repository.dart';

import '../entities/GetCartResponseEntity.dart';
import '../entities/failurs.dart';

class DeleteItemInCartUseCase{
  CartRepository cartRepository ;
  DeleteItemInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId){
    return cartRepository.deleteItemInCart(productId);
  }
}