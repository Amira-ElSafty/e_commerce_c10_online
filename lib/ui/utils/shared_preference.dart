import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{
  static late SharedPreferences sharedPreference ;

  static init()async{
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<bool> removeData({required String key}){
    return sharedPreference.remove(key);
  }

  static Future<bool> saveData({required String key , required dynamic value}){
    if(value is int){
      return sharedPreference.setInt(key, value);
    }else if(value is double){
      return sharedPreference.setDouble(key, value);
    }else if(value is String){
      return sharedPreference.setString(key, value);
    }else{
      return sharedPreference.setBool(key, value);
    }
  }

  static Object? getData({required String key}){
    return sharedPreference.get(key);
  }
}
