import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"adham","email":"adham423266@route.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MDk2MGNkYmU4YjUyMzIzNWE1NjlkYiIsIm5hbWUiOiJhZGhhbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzExODkwNjM4LCJleHAiOjE3MTk2NjY2Mzh9.a2EQGkZs7CjDlMPzVyjVupYQ4EXSY8UFsb-GD7h78nI"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  UserEntity? user;
  String? token;

}