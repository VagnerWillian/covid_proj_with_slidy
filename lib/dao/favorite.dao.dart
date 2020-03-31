import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteDao{

  final _KEY;

  FavoriteDao(this._KEY);

  Future<String> getPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(_KEY);
  }

  setPreferences({@required String value}) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_KEY, value);
  }

  clearPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}