import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_online/data/model/response/AddCartResponseDto.dart';
import 'package:flutter_e_commerce_c10_online/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:flutter_e_commerce_c10_online/data/model/response/GetCartResponseDto.dart';
import 'package:flutter_e_commerce_c10_online/data/model/response/ProductResponseDto.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/shared_preference.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/failurs.dart';
import '../model/request/LoginRequest.dart';
import '../model/request/RegisterRequest.dart';
import '../model/response/LoginResponseDto.dart';
import '../model/response/RegisterResponseDto.dart';
import 'ApiConstatnts.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance ;

  static ApiManager getInstance(){
    _instance??= ApiManager._();
    return _instance!;
  }
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password,
      String rePassword, String phone) async {
    var connectivityResult = await Connectivity()
        .checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.registerApi);
      var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phone,
          rePassword: rePassword
      );
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse = RegisterResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(registerResponse);
      }else{
        return Left(ServerError(errorMessage: registerResponse.error!= null?
        registerResponse.error!.msg!:
            registerResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }


  Future<Either<Failures, LoginResponseDto>> login(String email, String password) async {
    var connectivityResult = await Connectivity()
        .checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.loginApi);
      var loginRequest = LoginRequest(
        email: email,
        password: password
      );
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(loginResponse);
      }else{
        return Left(ServerError(errorMessage: loginResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories() async {
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.getAllCategoriesApi);
      var response = await http.get(url);
      var categoriesResponse = CategoryOrBrandResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(categoriesResponse);
      }else{
        return Left(ServerError(errorMessage: categoriesResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands() async {
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.getAllBrandsApi);
      var response = await http.get(url);
      var brandResponse = CategoryOrBrandResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(brandResponse);
      }else{
        return Left(ServerError(errorMessage: brandResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.getAllProductsApi);
      var response = await http.get(url);
      var productResponse = ProductResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(productResponse);
      }else{
        return Left(ServerError(errorMessage: productResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, AddCartResponseDto>> addToCart(String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.addToCartApi);
      // get token
      var token = SharedPreference.getData(key: 'Token');
      var response = await http.post(url,
          body: {
        'productId':productId
          },
      headers: {
        'token': token!.toString()
      });
      var addCartResponse = AddCartResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(addCartResponse);
      }
      else if(response.statusCode == 401){
        return Left(ServerError(errorMessage: addCartResponse.message));
      }else{
        return Left(ServerError(errorMessage: addCartResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.addToCartApi);
      // get token
      var token = SharedPreference.getData(key: 'Token');
      var response = await http.get(url,
      headers: {
        'token': token!.toString()
      });
      var getCartResponse = GetCartResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(getCartResponse);
      }
      else if(response.statusCode == 401){
        return Left(ServerError(errorMessage: getCartResponse.message));
      }else{
        return Left(ServerError(errorMessage: getCartResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, '${ApiEndPoints.addToCartApi}/$productId');
      // get token
      var token = SharedPreference.getData(key: 'Token');
      var response = await http.delete(url,
      headers: {
        'token': token!.toString()
      });
      var deleteItemInCartResponse = GetCartResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(deleteItemInCartResponse);
      }
      else if(response.statusCode == 401){
        return Left(ServerError(errorMessage: deleteItemInCartResponse.message));
      }else{
        return Left(ServerError(errorMessage: deleteItemInCartResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      int count,String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, '${ApiEndPoints.addToCartApi}/$productId');
      // get token
      var token = SharedPreference.getData(key: 'Token');
      var response = await http.put(url,
      body: {
        'count' : '$count'
      },
      headers: {
        'token': token!.toString()
      });
      var updateCountInCartResponse = GetCartResponseDto.fromJson(
          jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // success
        return Right(updateCountInCartResponse);
      }
      else if(response.statusCode == 401){
        return Left(ServerError(errorMessage: updateCountInCartResponse.message));
      }else{
        return Left(ServerError(errorMessage: updateCountInCartResponse.message
        ));
      }
    }else{
      // no internet connection
      return Left(NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}