import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/app/modules/home/home_controller.dart';
import 'package:studysmma/app/modules/saved/saved_controller.dart';
import 'package:studysmma/models/country.model.dart';

class CountryDelegate extends SearchDelegate<String> {

  HomeController get _homeController => Modular.get<HomeController>();
  List<String> _listCountry = [];

  CountryDelegate(){
    for(CountryModel m in _homeController.countries.value){
      _listCountry.add(m.country);
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {

    //Actions for app bar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Text(query),

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? _listCountry
        : _listCountry.where((p) => p.contains(query)).toList();



    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: () {
        showResults(context);
      },
      trailing: Icon(Icons.remove_red_eye),
      title: RichText(
        text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ]),
      ),
    ),
      itemCount: _listCountry.length,
    );
  }
}