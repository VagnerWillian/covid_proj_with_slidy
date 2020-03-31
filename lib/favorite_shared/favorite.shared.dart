import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:studysmma/dao/favorite.dao.dart';
import 'package:studysmma/models/country.model.dart';

class FavoriteShared{

  FavoriteDao _favoriteDao;

  List<CountryModel> _favoriteList = [];

  FavoriteShared(this._favoriteDao){
   loadFavorites();
  }

  List<CountryModel> get getFavorites => _favoriteList;

  setFavorite({@required CountryModel country}) {
    print(getFavorites.where((m)=>m.country == country.country).length);
    if(getFavorites.where((m)=>m.country == country.country).length == 0) {
      getFavorites.add(country);
      saveOnShare();
    }else{
      removeFavorite(country: country);
      saveOnShare();
    }
  }

  removeFavorite({@required CountryModel country}){
    _favoriteList.removeWhere((c)=>c.country == country.country);
  }

  saveOnShare()=> _favoriteDao.setPreferences(value: listFavoritesInJson());

  String listFavoritesInJson() {
    List<Map<String, dynamic>> _listMap = [];
    _favoriteList.map((m){
      _listMap.add(m.toJson());
    }).toList();
    return json.encode(_listMap);
  }



  loadFavorites()async{
    String encodedJson = await _favoriteDao.getPreferences();
    if(encodedJson != null && encodedJson.isNotEmpty){
      var decodedJson = json.decode(encodedJson);
      for(Map cMap in decodedJson){
         _favoriteList.add(CountryModel.fromJson(cMap));
      }
    }
  }

  clearFavorites() async {
    _favoriteDao.clearPreferences();
    _favoriteDao.getPreferences();
  }

}