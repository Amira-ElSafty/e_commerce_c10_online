import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/domain/repository/repository/home_tab_repositoy.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/failurs.dart';

class GetAllCategoriesUseCase{
  HomeRepository homeTabRepository ;
  GetAllCategoriesUseCase({required this.homeTabRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke(){
   return homeTabRepository.getCategories();
  }
}