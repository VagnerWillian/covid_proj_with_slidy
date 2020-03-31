import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:studysmma/favorite_shared/favorite.shared.dart';
import 'package:studysmma/models/country.model.dart';
import 'package:studysmma/repository/corona_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final CoronaRepository _coronaRepository;
  final FavoriteShared _favoriteShared;

  @observable
  ObservableFuture countries; // recebe todos

  @observable
  CountryModel selectCountry; // recebe um só

  @observable
  List<CountryModel> favorites; // recebe a lista de favoritos

  _HomeControllerBase(this._coronaRepository, this._favoriteShared){
    _coronaRepository.fetchAllCountries().asObservable().then((x){
      getCountry();
    });
    countries = _coronaRepository.fetchAllCountries().asObservable();
    getFavorites();
  }

  @action
  getCountry({String country}){
   selectCountry = _coronaRepository.selectCountry(country: country);
  }

  @action
  setFavorite({@required CountryModel country}){
    _favoriteShared.setFavorite(country: country);
    getFavorites();
  }

  @action
  getFavorites(){
    favorites = _favoriteShared.getFavorites;
  }

  @action
  clearFavorites(){
    _favoriteShared.clearFavorites();
    getFavorites();
  }
}
