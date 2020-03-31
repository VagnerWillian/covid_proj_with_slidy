import 'package:dio/dio.dart';
import 'package:studysmma/models/country.model.dart';
import 'package:studysmma/app/constraints.dart';

class CoronaRepository{

  Dio dio;
  CoronaRepository(this.dio);

  List<CountryModel> _countries = [];

  CountryModel selectCountry({String country}){
    return country == null ? _countries[0] : _countries.where((c) => c.country == country).first;
  }

  Future<List<CountryModel>> fetchAllCountries() async {
      var request = await dio.get("$URL_API/countries/");
      if(request.statusCode == 200){
        var dataJson = request.data;
        return getAllCountries(dataJson);
      }else{
        print("Erro");
      }
  }

  getAllCountries(dataJson) {
    for(Map country in dataJson){
      _countries.add(CountryModel.fromJson(country));
    }
    return _countries;
  }

/*  fetchGlobalCases() async {
    var request = await dio.get("$URL_API/all");
    if(request.statusCode == 200){
      var dataJson = request.data;
      return CountryModel.fromJson(dataJson);
    }
  }*/
}