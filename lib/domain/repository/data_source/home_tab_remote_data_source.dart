import 'package:dartz/dartz.dart';
import '../../entities/CategoryOrBrandResponseEntity.dart';
import '../../entities/ProductResponseEntity.dart';
import '../../entities/failurs.dart';

abstract class HomeTabRemoteDataSource{
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getBrands();
  Future<Either<Failures,ProductResponseEntity>> getProducts();


}