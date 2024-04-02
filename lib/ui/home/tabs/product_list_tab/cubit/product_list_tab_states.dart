import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';

abstract class ProductListTabStates{}
class ProductInitialState extends ProductListTabStates{}
class ProductLoadingState extends ProductListTabStates{
  String? loadingMessage ;
  ProductLoadingState({required this.loadingMessage});
}
class ProductErrorState extends ProductListTabStates{
  Failures? errors ;
  ProductErrorState({required this.errors});
}
class ProductSuccessState extends ProductListTabStates {
  ProductResponseEntity productResponseEntity ;
  ProductSuccessState({required this.productResponseEntity});
}