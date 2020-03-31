import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:studysmma/favorite_shared/save.preferences.dart';
import 'package:studysmma/models/country.model.dart';
import 'package:studysmma/repository/corona_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final CoronaRepository _coronaRepository;

  @observable
  ObservableFuture countries; // recebe todos

  @observable
  CountryModel selectCountry; // recebe um só



  _HomeControllerBase(this._coronaRepository){
    countries = _coronaRepository.fetchAllCountries().asObservable().whenComplete((){
      getCountry();
    });
  }

  @action
  getCountry({String country}){
   selectCountry = _coronaRepository.selectCountry(country: country);
  }

}
