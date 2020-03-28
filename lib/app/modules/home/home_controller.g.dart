// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$countriesAtom = Atom(name: '_HomeControllerBase.countries');

  @override
  ObservableFuture<dynamic> get countries {
    _$countriesAtom.context.enforceReadPolicy(_$countriesAtom);
    _$countriesAtom.reportObserved();
    return super.countries;
  }

  @override
  set countries(ObservableFuture<dynamic> value) {
    _$countriesAtom.context.conditionallyRunInAction(() {
      super.countries = value;
      _$countriesAtom.reportChanged();
    }, _$countriesAtom, name: '${_$countriesAtom.name}_set');
  }

  final _$selectCountryAtom = Atom(name: '_HomeControllerBase.selectCountry');

  @override
  ObservableFuture<dynamic> get selectCountry {
    _$selectCountryAtom.context.enforceReadPolicy(_$selectCountryAtom);
    _$selectCountryAtom.reportObserved();
    return super.selectCountry;
  }

  @override
  set selectCountry(ObservableFuture<dynamic> value) {
    _$selectCountryAtom.context.conditionallyRunInAction(() {
      super.selectCountry = value;
      _$selectCountryAtom.reportChanged();
    }, _$selectCountryAtom, name: '${_$selectCountryAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  CountryModel getCountry({@required String country}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getCountry(country: country);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'countries: ${countries.toString()},selectCountry: ${selectCountry.toString()}';
    return '{$string}';
  }
}
