import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {

  String situation;
  int value;
  Color colors;
  bool reversed;

  InfoTile({@required this.situation, @required this.value, @required this.colors, this.reversed = false});

  @override
  Widget build(BuildContext context) {

    Widget _ballOnRight = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("$value • $situation", style: TextStyle(fontWeight: FontWeight.bold),),
        Container(
            margin: EdgeInsets.all(5),
            height: 30,
            width: 30,
            child: CircleAvatar(
              backgroundColor: colors,
            )),
      ],
    );

     Widget _ballOnLeft = Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Container(
               margin: EdgeInsets.all(5),
               height: 30,
               width: 30,
               child: CircleAvatar(
                 backgroundColor: colors,
               )),
           Text("$value • $situation", style: TextStyle(fontWeight: FontWeight.bold),)
         ]
    );

    return reversed ? _ballOnRight : _ballOnLeft;
  }
}
