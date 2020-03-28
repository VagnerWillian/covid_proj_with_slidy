import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:studysmma/models/country.model.dart';
import 'package:studysmma/repository/webservice.dart';

class CoronaRepository{
  Dio dio;

  CoronaRepository(this.dio);

  Future<CountryModel> selectCountry({String country}) async{
    var request = await dio.get(country == null ? "$URL_API/all" : "$URL_API/countries/$country");
    if(request.statusCode == 200){
      var dataJson = request.data;
      return CountryModel.fromJson(dataJson);
    }
  }

  Future<List<CountryModel>> fetchAllCountries() async {
      var request = await dio.get("$URL_API/countries/");
      if(request.statusCode == 200){
        var dataJson = request.data;

        return getAllCountries(dataJson);
      }
  }

  getAllCountries(dataJson) {
      List<CountryModel> _countries = [];

    for(Map country in dataJson){
      _countries.add(CountryModel.fromJson(country));
    }
    return _countries;
  }
}