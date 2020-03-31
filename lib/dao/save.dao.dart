import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDao{

  final _KEY;

  SaveDao(this._KEY);

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