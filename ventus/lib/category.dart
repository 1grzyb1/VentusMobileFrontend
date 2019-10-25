import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventus/choosing.dart';
import 'package:ventus/main.dart';

import 'Home.dart';
import 'PODO/Category.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();

}


class _CategoryState extends State<Category> {

  Color green = Color(0xff46B29D);
  Color red = Color(0xffFFAD6F);
  Color orange = Color(0xffFEB74E);
  Color lightBlue = Color(0xff91a5bb);
  Color blue = Color(0xff44647D);


  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
  ];


  Future<List<CategoryPODO>> _getCategories()  async {
    String url = "http://ventusapi.herokuapp.com/api/category";
    Response response = await get(url);
    String json = response.body.toString();
    final jsonResponse = jsonDecode(json);
    var list = jsonResponse as List;
    List<CategoryPODO> categories =  list.map((i) => CategoryPODO.fromJson(i)).toList();
    return categories;
  }

  SharedPreferences prefs;

  String name = "";
  String city = "";

  _getUser() async {
    prefs = await SharedPreferences.getInstance();
    String url = 'http://ventusapi.herokuapp.com/api/user';
    Map<String, String> headers = {"Authorization": "Bearer " + prefs.getString("token")};
    String json = '';
    Response response = await post(url, headers: headers, body: json);
    Map resp = jsonDecode(response.body.toString());
    setState(() {
      name = resp['first_name'];
      city = resp['location'];
    });
  }


  @override
  Widget build(BuildContext context) {
    _getUser();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blue),
        backgroundColor: Color(0xfff0f0f0),
        title: Image.asset('assets/logo07.png', fit: BoxFit.cover, scale: 1.7,),
        centerTitle: true,
      ),
      body: Center(
          child: ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 4000.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder(
                future: _getCategories(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Text("Please Wait...");
                  }else{
                    return Wrap(children: <Widget>[...snapshot.data.map((item) => GestureDetector(
                      onTap: () async {
                        prefs.setInt("categoryID", item.id);
                        Navigator.of(context).push(
                            MaterialPageRoute<Null>(builder: (BuildContext context) {
                              return new Choose();
                            }));
                      },
                      child:SizedBox(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: new Border.all(
                              color: blue,
                            ),
                          ),
                          child: Container(
                            child: new Text(item.category, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: blue, fontFamily: 'concertone')),
                            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                        ),
                      ),
                    )).toList()],);
                  }
                },
              ),
            ),
          )),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: blue,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 120,
                child: DrawerHeader(
                  child: Container(
                    child: Center(
                      child: Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(Icons.person, color: Colors.white,),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: blue,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 3, 0, 0),
                              child: Text(city, style: TextStyle(fontSize: 10, color: Colors.white),),
                            ),
                          ],
                        )
                      ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: lightBlue,
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home, color: lightBlue, size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: FlatButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => Home()
                            ));
                          },
                            child: Text("HOME", style: TextStyle(color: Colors.white),)),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.category, color: lightBlue, size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => Category()
                            ));
                          },
                            child: Text("CATEGORIES", style: TextStyle(color: Colors.white),)),
                      )
                    ],
                  ),
                ),
                onTap: () {

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
