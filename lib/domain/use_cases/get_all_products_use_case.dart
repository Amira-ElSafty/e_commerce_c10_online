import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/home_tab_repositoy.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/failurs.dart';

class GetAllProductsUseCase{
  HomeRepository homeTabRepository ;
  GetAllProductsUseCase({required this.homeTabRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke(){
   return homeTabRepository.getProducts();
  }
}