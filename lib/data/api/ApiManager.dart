import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
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
}