import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/home_tab_repositoy.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/failurs.dart';

class AddCartUseCase{
  HomeRepository homeRepository ;
  AddCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId){
   return homeRepository.addToCart(productId);
  }
}