import 'package:flutter_e_commerce_c10_online/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/failurs.dart';

abstract class CartStates{}
class CartInitialState extends CartStates{}
class GetCartLoadingState extends CartStates{
  String? loadingMessage ;
  GetCartLoadingState({required this.loadingMessage});
}
class GetCartErrorState extends CartStates{
  Failures? errors ;
  GetCartErrorState({required this.errors});
}
class GetCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity ;
  GetCartSuccessState({required this.responseEntity});
}
class DeleteItemInCartLoadingState extends CartStates{
  String? loadingMessage ;
  DeleteItemInCartLoadingState({required this.loadingMessage});
}
class DeleteItemInCartErrorState extends CartStates{
  Failures? errors ;
  DeleteItemInCartErrorState({required this.errors});
}
class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity ;
  DeleteItemInCartSuccessState({required this.responseEntity});
}
class UpdateCountInCartLoadingState extends CartStates{
  String? loadingMessage ;
  UpdateCountInCartLoadingState({required this.loadingMessage});
}
class UpdateCountInCartErrorState extends CartStates{
  Failures? errors ;
  UpdateCountInCartErrorState({required this.errors});
}
class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity ;
  UpdateCountInCartSuccessState({required this.responseEntity});
}
