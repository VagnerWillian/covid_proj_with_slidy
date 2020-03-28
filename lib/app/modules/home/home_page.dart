import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studysmma/models/country.model.dart';
import 'home_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

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
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(
              builder: (_) {
                if(controller.selectCountry.value != null){
                  CountryModel country = controller.selectCountry.value;

                  return Column(
                    children: <Widget>[
                      Center(
                        child: Text("Casos em todo o mundo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: PieChart(
                          PieChartData(
                            borderData: FlBorderData(
                              show: false
                            ),
                              sections: sections(country)
                          ),
                        ),
                      ),
                      Container(
                        width: 188,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 30,
                                    width: 30,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black.withOpacity(0.8),
                                    )),
                                SizedBox(width: 10,),
                                Text("${country.cases} Suspeitos", style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 30,
                                    width: 30,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                    )),
                                SizedBox(width: 10,),
                                Text("${country.recovered} Recuperados", style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 30,
                                    width: 30,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                    )),
                                SizedBox(width: 10,),
                                Text("${country.deaths} Mortos", style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          RaisedButton(
                            child: Text("Brazil"),
                            onPressed: (){
                              controller.getCountry(country: "brazil");
                            },
                          )
                          ],
                        ),
                      )
                    ],
                  );
                }else{
                  return Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.black.withOpacity(0.8)),strokeWidth: 50,),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}

List<PieChartSectionData> sections(CountryModel country){
  return [
    PieChartSectionData(
        radius: 50,
        color: Colors.black.withOpacity(0.8),
        title: "",
        value: country.cases
            //- (country.deathsPerOneMillion + country.deaths + country.critical + country.active
            //+ country.todayDeaths + country.todayCases + country.recovered + country.critical)
        / 360,
        titleStyle: TextStyle(color: Colors.red)
    ),
    PieChartSectionData(
        radius: 60,
        color: Colors.red,
        title: "",
        value: country.todayCases / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 60,
        color: Colors.red,
        title: "",
        value: country.deaths / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 60,
        color: Colors.green,
        title: "",
        value: country.todayDeaths / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 60,
        color: Colors.green,
        title: "",
        value: country.recovered / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 60,
        color: Colors.green,
        title: "",
        value: country.active / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 60,
        color: Colors.green,
        title: "",
        value: country.critical / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 60,
        color: Colors.green,
        title: "",
        value: country.casesPerOneMillion / 360
    ),
    PieChartSectionData(
        titleStyle: TextStyle(color: Colors.black.withOpacity(0.8),),
        radius: 60,
        color: Colors.green,
        title: "",
        value: country.deathsPerOneMillion / 360
    ),
  ];
}