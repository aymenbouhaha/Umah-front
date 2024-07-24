import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:umah_front/models/http_exception.dart';
import 'package:umah_front/shared/constants/constants.dart';
import 'package:umah_front/shared/network/remote/dio_helper.dart';

import '../../models/professor.model.dart';

class TeacherProvider with ChangeNotifier{

  List<Professor> _professors=[];
  
  TeacherProvider({ this.authToken});
  
  String? authToken;

  List<Professor> get professors =>  [..._professors];

  Future<void> fetchProfessors() async {
    try{
      Response response =await DioHelper.getData(url: baseUrl+"professeur", token: "Bearer ${authToken}");
      List<Professor> professors=professorFromJson(response.data);
      _professors=professors;
      notifyListeners();
    }on DioError catch(e){
      throw HttpException(e.response!.data["message"].toString());
    }catch (e){
      throw (e);
    }
  }














}