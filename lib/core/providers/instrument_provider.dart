


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../models/instrument.model.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/dio_helper.dart';

class InstrumentProvider with ChangeNotifier{


  Map<String , List<Instrument>> _itemsMap={};

  Map<String , List<Instrument>> get instrumentsMap => {..._itemsMap};

  List<Instrument> get instruments {
    List<Instrument> items=[];
    _itemsMap.forEach((key, value) {
      items.addAll(value);
    });
    return items;
  }

  Future<void> fetchInstruments() async {
    try{
      Response response =await DioHelper.getData(url: baseUrl+"instrument");
      List<Instrument> instruments=instrumentFromJson(response.data);
      _itemsMap=_splitItems(instruments);
      notifyListeners();
    }on DioError catch(e){
      throw HttpException(e.response!.data["message"].toString());
    }catch (e){
      throw (e);
    }
  }


  _splitItems(List<Instrument> items){
    Map<String , List<Instrument>> itemsMap={};
    items.forEach((element) {
      if(itemsMap.containsKey(element.category)){
        itemsMap[element.category]!.add(element);
      }else{
        itemsMap[element.category]=[element];
      }
    });
    return itemsMap;
  }






}