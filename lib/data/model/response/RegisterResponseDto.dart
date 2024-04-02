import 'package:flutter_e_commerce_c10_online/data/model/response/Error.dart';
import '../../../domain/entities/AuthResultEntity.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"adham","email":"adham423266@route.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MDk2MGNkYmU4YjUyMzIzNWE1NjlkYiIsIm5hbWUiOiJhZGhhbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzExODkwNjM4LCJleHAiOjE3MTk2NjY2Mzh9.a2EQGkZs7CjDlMPzVyjVupYQ4EXSY8UFsb-GD7h78nI"

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user,
    this.error,
      this.token,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
  }
  UserDto? user;
  String? token;
  String? message;
  String? statusMsg ;
  Error? error ;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity()
    );
  }

}