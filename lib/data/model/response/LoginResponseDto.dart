

import '../../../domain/entities/AuthResultEntity.dart';
import 'UserDto.dart';

class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.user, 
      this.token,});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      userEntity:user?.toUserEntity() ,
      token: token
    );
  }

}