import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:studysmma/dao/save.dao.dart';
import 'package:studysmma/models/country.model.dart';

class FavoritePreferences{

  SaveDao _favoriteDao;

  List<CountryModel> _savesList = [];

  FavoritePreferences(this._favoriteDao){
   loadSaves();
  }

  List<CountryModel> get getSaves => _savesList;

  setSave({@required CountryModel country}) {
    if(getSaves.where((m)=>m.country == country.country).length == 0) {
      getSaves.add(country);
      savePreferences();
    }else{
      removeSave(country: country);
      savePreferences();
    }
  }

  removeSave({@required CountryModel country}){
    _savesList.removeWhere((c)=>c.country == country.country);
  }

  savePreferences()=> _favoriteDao.setPreferences(value: listSavesInJson());

  String listSavesInJson() {
    List<Map<String, dynamic>> _listMap = [];
    _savesList.map((m){
      _listMap.add(m.toJson());
    }).toList();
    return json.encode(_listMap);
  }



  loadSaves()async{
    String encodedJson = await _favoriteDao.getPreferences();
    if(encodedJson != null && encodedJson.isNotEmpty){
      var decodedJson = json.decode(encodedJson);
      for(Map cMap in decodedJson){
         _savesList.add(CountryModel.fromJson(cMap));
      }
    }
  }

  clearPreferences() async {
    _favoriteDao.clearPreferences();
    _favoriteDao.getPreferences();
  }

}