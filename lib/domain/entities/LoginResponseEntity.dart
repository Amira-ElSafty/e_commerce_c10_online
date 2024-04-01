
import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"adham","email":"adham22@route.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NDhjMDYwMDMzODlkMWJkNzEwNGY4NiIsIm5hbWUiOiJhZGhhbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzExODk2NjM1LCJleHAiOjE3MTk2NzI2MzV9._WGqUVUE6T-pEuZPJnlwDue37tSYMZNqwl47Bsax5K8"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  UserEntity? user;
  String? token;


}