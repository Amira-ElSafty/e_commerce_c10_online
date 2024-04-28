import 'package:flutter_e_commerce_c10_online/domain/entities/AddCartResponseEntity.dart';
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

class AddToCartLoadingState extends ProductListTabStates {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends ProductListTabStates {
  Failures? errors;

  AddToCartErrorState({required this.errors});
}

class AddToCartSuccessState extends ProductListTabStates {
  AddCartResponseEntity addCartResponseEntity;

  AddToCartSuccessState({required this.addCartResponseEntity});
}