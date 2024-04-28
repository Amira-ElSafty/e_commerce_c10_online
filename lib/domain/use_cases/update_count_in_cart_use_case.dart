import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/cart_repository.dart';

import '../entities/GetCartResponseEntity.dart';
import '../entities/failurs.dart';

class UpdateCountInCartUseCase{
  CartRepository cartRepository ;
  UpdateCountInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(int count,String productId){
    return cartRepository.updateCountInCart(count,productId);
  }
}