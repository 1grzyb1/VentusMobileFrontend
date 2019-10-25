import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventus/MySliderThumbShape.dart';
import 'package:ventus/PODO/SubcategoryPODO.dart';
import 'package:ventus/RoundSliderTrackShape.dart';

import 'Home.dart';

class Choose extends StatefulWidget {
  @override
  ChooseScreen createState() => ChooseScreen();
}

class ChooseScreen extends State<Choose> {
  SharedPreferences prefs;
  String text = "";
  int id = 0;
  List<SubcategoryPODO> categories;
  bool ones = true;
  inintShared() async{
    prefs = await SharedPreferences.getInstance();
    text = prefs.getInt("categoryID").toString();
    String url = "http://ventusapi.herokuapp.com/api/category/" +text + "/subcategories";
    Response response = await get(url);
    String json = response.body.toString();
    final jsonResponse = jsonDecode(json);
    var list = jsonResponse as List;
    categories =  list.map((i) => SubcategoryPODO.fromJson(i)).toList();
    setState(() {
      text = categories[0].name;
    });
  }
  double _value = 0.5;
  @override
  Widget build(BuildContext context) {
    if(ones){
      inintShared();
      ones = false;
    }
    Color orange = Color(0xffFFAD6F);
    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Image.asset('assets/logo07.png'),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: SizedBox(
                  child: Container(
                    height: 270 + 20*_value,
                    width: 270 + 20*_value,
                    decoration: new BoxDecoration(
                      color: orange,
                      shape: BoxShape.circle,
                      border: new Border.all(
                        width: 30 - 20*_value,
                        color: Color(0xffffdabf),
                      ),
                    ),
                    child: Container(
                      child: Center(child: new Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white))),
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),

                    ),
                  ),
                ),
              ),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 11,
            trackShape: RoundSliderTrackShape(radius: 8),
            thumbShape: MySliderThumbShape(),
            inactiveTrackColor: Color(0xffffdabf),
            activeTrackColor: orange,
            thumbColor: Colors.white,
          ),
          child: Slider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
        ),
      ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: FlatButton(
                  child: _animatedButtonUI,
                  onPressed: () {
                    setState(()  {
                      _addSub();
                      id++;
                      if(id < categories.length){
                        text = categories[id].name;
                      }
                      else{
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Home()
                        ));
                      }
                    });
                  },
                ),
              )
            ],
          ),
      )
    );
  }
  _addSub() async {
    String url = 'http://ventusapi.herokuapp.com/api/user/subcategory/new';
    Map<String, String> headers = {"Authorization": "Bearer " + prefs.getString("token")};
    String json = '{"subcategory": "' + categories[id].id.toString() + '","percentage": "'+ (_value*100).toString() +'"}';
    Response response = await post(url, headers: headers, body: json);
    print(response.statusCode.toString());
  }
}

Widget get _animatedButtonUI => Container(
  height: 50,
  width: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    color: Color(0xff44647D),
  ),
  child: Center(
    child: Icon(Icons.arrow_forward, color: Colors.white,),
  ),
);

