import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/app/modules/home/home_controller.dart';
import 'package:studysmma/app/modules/saved/saved_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studysmma/models/country.model.dart';

class SavedPage extends StatefulWidget {
  final String title;
  const SavedPage({Key key, this.title = "Saved"}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  //use 'controller' variable to access controller
  @override
  SavedController get savedController => Modular.get<SavedController>();

  @override
  HomeController get homeController => Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_){
          if(savedController.favorites != null){
            return ListView.builder(
              itemCount: savedController.favorites.length,
              itemBuilder: (context, item){

                CountryModel _coutry = savedController.favorites[item];

                return RaisedButton(
                  color: item % 2 == 0 ? Colors.white : Colors.grey[200],
                  onPressed: (){
                    homeController.selectCountry = _coutry;
                    Modular.to.pop('/');
                  },
                  child: ListTile(
                    title: Text(_coutry.country),
                    trailing:  GestureDetector(
                      onTap: ()=>savedController.setFavorite(country: _coutry),
                      onLongPress: ()=>savedController.clearFavorites(),
                      child: Container(
                        child: Icon(FontAwesomeIcons.trash, color: Colors.red, size: 20,)
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
