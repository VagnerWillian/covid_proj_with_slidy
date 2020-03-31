import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/app/modules/home/widgets/info.tile.dart';
import 'package:studysmma/app/modules/saved/saved_controller.dart';
import 'package:studysmma/delegates/country.delegate.dart';
import 'package:studysmma/models/country.model.dart';
import 'home_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Actually Situation COVID19 - Corona"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  HomeController get controller => super.controller;

  //use 'controller' variable to access controller
  @override
  SavedController get savedController => Modular.get<SavedController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        title: Text(widget.title, style: TextStyle(fontSize: 15),),
        actions: <Widget>[
          Container(
            width: 50,
            child: RaisedButton(
              onPressed: () {
                showSearch(context: context, delegate: CountryDelegate());
              },
              child: Icon(
                Icons.search,
                color: Colors.grey[800],
                size: 25,
              ),
              elevation: 0,
              color: Colors.transparent,
            ),
          ),
          Container(
            width: 60,
            child: RaisedButton(
              onPressed: ()=>Modular.to.pushNamed('/saved/'),
              child: Icon(
                Icons.save,
                color: Colors.grey[800],
                size: 25,
              ),
              elevation: 0,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Observer(
            builder: (_){
              if(controller.countries.value != null){
                List<CountryModel> _listCountries = controller.countries.value;
                return Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _listCountries.length,
                    itemBuilder: (_, item){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          elevation: 0,
                          onPressed: (){
                            controller.getCountry(country: _listCountries[item].country);
                          },
                          child: Text(_listCountries[item].country),
                        ),
                      );
                    },
                  ),
                );
              }else{
                return Container();
              }
            },
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Observer(
                builder: (_) {
                  if(controller.selectCountry != null){
                    CountryModel country = controller.selectCountry;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: <Widget>[
                              Text(country == null ? "Casos em todo o  mundo" : "Situação atual no país", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              Text(country == null ? "" : country.country, style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: PieChart(
                            PieChartData(
                                borderData: FlBorderData(
                                    show: false
                                ),
                                sections: sections(country),
                                centerSpaceRadius: 50,
                                startDegreeOffset: 150
                            ),
                            swapAnimationDuration: Duration(seconds: 1),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                InfoTile(situation: "Casos", value: country.cases, colors: Colors.grey.withOpacity(0.4), reversed: true,),
                                InfoTile(situation: "Casos por dia", value: country.todayCases, colors: Colors.black.withOpacity(0.4), reversed: true,),
                                InfoTile(situation: "Mortos", value: country.deaths, colors: Colors.red.withOpacity(0.6), reversed: true,),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InfoTile(situation: "Mortos por dia", value: country.todayDeaths, colors: Colors.red),
                                InfoTile(situation: "Críticos", value: country.critical, colors: Colors.yellow[800]),
                                InfoTile(situation: "Curados", value: country.recovered, colors: Colors.green),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: ()=>savedController.setFavorite(country: controller.selectCountry),
                              onLongPress: ()=>savedController.clearFavorites(),
                              child: Container(
                                child: savedController.favorites.where((c)=>c.country == country.country).length > 0 ?
                                Icon(Icons.save, color: Colors.yellow[800], size: 35,) :
                                Icon(Icons.save, color: Colors.grey[800], size: 35,),
                              ),
                            ),
                            Text("Salvar país", style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ],
                    );
                  }else{
                    return Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.grey.withOpacity(0.4)),strokeWidth: 50,),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> sections(CountryModel country){
  return [
    PieChartSectionData(
        radius: 50,
        color: Colors.grey.withOpacity(0.4),
        title: "",
        value: country.cases / 360,
        titleStyle: TextStyle(color: Colors.red)
    ),
    PieChartSectionData(
        radius: 50,
        color: Colors.black.withOpacity(0.4),
        title: "",
        value: country.todayCases / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 50,
        color: Colors.red,
        title: "",
        value: country.deaths / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 50,
        color: Colors.red.withOpacity(0.6),
        title: "",
        value: country.todayDeaths / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 50,
        color: Colors.green,
        title: "",
        value: country.recovered / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 50,
        color: Colors.yellow[800],
        title: "",
        value: country.critical / 360
    ),
  ];
}