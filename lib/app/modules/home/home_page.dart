import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/models/country.model.dart';
import 'home_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Slidy + Modular e Mobx"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  // TODO: implement controller
  HomeController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        title: Text(widget.title),
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
                    print(controller.favorites);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(country == null ? "Casos em todo o  mundo" : "Situação atual no ${country.country}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Casos • ${country.cases}", style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Container(
                                        height: 30,
                                        width: 30,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black.withOpacity(0.8),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Casos por dia • ${country.todayCases}", style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Container(
                                        height: 30,
                                        width: 30,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black.withOpacity(0.6),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Mortos • ${country.deaths}", style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Container(
                                        height: 30,
                                        width: 30,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red.withOpacity(0.6),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        height: 30,
                                        width: 30,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                        )),
                                    SizedBox(width: 10,),
                                    Text("${country.todayDeaths} • Mortos por dia", style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        height: 30,
                                        width: 30,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.yellow[800],
                                        )),
                                    SizedBox(width: 10,),
                                    Text("${country.critical} • Críticos", style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        height: 30,
                                        width: 30,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,
                                        )),
                                    SizedBox(width: 10,),
                                    Text("${country.recovered} • Curados", style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: ()=>controller.setFavorite(country: controller.selectCountry),
                              onLongPress: ()=>controller.clearFavorites(),
                              child: Container(
                                child: controller.favorites.where((c)=>c.country == country.country).length > 0 ? Icon(Icons.star, color: Colors.yellow[800], size: 50,) : Icon(Icons.star_border, color: Colors.yellow[800], size: 50,),
                              ),
                            ),
                            Text("Salvar país")
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