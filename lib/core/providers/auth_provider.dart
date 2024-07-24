import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:umah_front/shared/network/local/cache_helper.dart';
import 'package:umah_front/shared/network/remote/dio_helper.dart';

import '../../models/user.model.dart';
import '../../shared/constants/constants.dart';

class AuthenticationProvider with ChangeNotifier{


  String? _token;
  String? _id;
  bool isAuthenticated=false;
  User? user;

  String? get token => _token!;

  Future<void> login(String email, String password) async{
    try{
      Response response =await DioHelper.postData(url: baseUrl+"auth/login", data: {
        "email" : email,
        "password" : password
      });
      _id=response.data["id"];
      _token=response.data["access_token"];
      isAuthenticated=true;
      //TODO :: instanciate the user

      CacheHelper.putData(key: "token", data: _token);
      //TODO :: cache the user data;
      notifyListeners();
    }on DioError catch(e){
      throw HttpException(e.response!.data["message"].toString());
    }catch (e){
      throw (e);
    }
    
  }

  Future<void> signUp(Map<String,dynamic> credentials,bool isStudent) async {
    String url=isStudent ? "auth/register/etudiant" : "auth/register/professeur";

    try{
      await DioHelper.postData(url: baseUrl+url, data: credentials);
    }on DioError catch(e){
      throw HttpException(e.response!.data["message"].toString());
    }catch (e){
      throw (e);
    }

  }

  logout(){
    CacheHelper.sharedPreferences.clear();
    isAuthenticated=false;
    user=null;
    _token=null;
    _id=null;
    notifyListeners();
  }

  Future<bool> autoLogin() async {
    String token=await CacheHelper.getData(key: "token");
    if(token!=null){
      _token=token;
      isAuthenticated=true;
      notifyListeners();
      return true;
    }
    return false;
  }


}