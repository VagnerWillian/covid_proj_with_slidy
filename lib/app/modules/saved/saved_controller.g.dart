// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SavedController on _SavedControllerBase, Store {
  final _$favoritesAtom = Atom(name: '_SavedControllerBase.favorites');

  @override
  List<CountryModel> get favorites {
    _$favoritesAtom.context.enforceReadPolicy(_$favoritesAtom);
    _$favoritesAtom.reportObserved();
    return super.favorites;
  }

  @override
  set favorites(List<CountryModel> value) {
    _$favoritesAtom.context.conditionallyRunInAction(() {
      super.favorites = value;
      _$favoritesAtom.reportChanged();
    }, _$favoritesAtom, name: '${_$favoritesAtom.name}_set');
  }

  final _$_SavedControllerBaseActionController =
      ActionController(name: '_SavedControllerBase');

  @override
  dynamic setFavorite({@required CountryModel country}) {
    final _$actionInfo = _$_SavedControllerBaseActionController.startAction();
    try {
      return super.setFavorite(country: country);
    } finally {
      _$_SavedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getFavorites() {
    final _$actionInfo = _$_SavedControllerBaseActionController.startAction();
    try {
      return super.getFavorites();
    } finally {
      _$_SavedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFavorites() {
    final _$actionInfo = _$_SavedControllerBaseActionController.startAction();
    try {
      return super.clearFavorites();
    } finally {
      _$_SavedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'favorites: ${favorites.toString()}';
    return '{$string}';
  }
}
