import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:studysmma/favorite_shared/save.preferences.dart';
import 'package:studysmma/models/country.model.dart';

part 'saved_controller.g.dart';

class SavedController = _SavedControllerBase with _$SavedController;

abstract class _SavedControllerBase with Store {

  final FavoritePreferences _favoriteShared;

  @observable
  List<CountryModel> favorites;

  _SavedControllerBase(this._favoriteShared) {
    getFavorites();
  } // recebe a lista de favoritos

  @action
  setFavorite({@required CountryModel country}){
    _favoriteShared.setSave(country: country);
    getFavorites();
  }

  @action
  getFavorites(){
    favorites = _favoriteShared.getSaves;
  }

  @action
  clearFavorites(){
    _favoriteShared.clearPreferences();
    getFavorites();
  }
}
