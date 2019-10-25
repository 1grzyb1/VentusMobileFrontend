import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventus/User.dart';
import 'package:ventus/main.dart';

import 'PODO/Category.dart';
import 'PODO/UserPODO.dart';
import 'category.dart';
import 'laoder/ColorLoader.dart';

class Home extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}



class _SecondScreenState extends State<Home> {
  Color blue = Color(0xff517193);
  Color lightBlue = Color(0xff91a5bb);
  Color green = Color(0xff46B29D);
  Color red = Color(0xffFFAD6F);
  Color orange = Color(0xffFEB74E);
  String name = "";
  String city = "";
  String token = "";
  List<Color> colors = [
    Colors.red,
  ];
  _refreshToken() async {
    String url = 'http://ventusapi.herokuapp.com/api/token/refresh';
    var map = new Map<String, dynamic>();
    map['refresh_token'] = prefs.getString('refresfToken');
    Response response = await post(
      url,
      body: map,
    );
    Map resp = jsonDecode(response.body.toString());
    prefs.setString('token', resp['token']);
    prefs.setString('refresfToken', resp['refresh_token']);
    token = prefs.getString('token');
  }

  _getUser() async {
    prefs = await SharedPreferences.getInstance();
//    _refreshToken();
    String url = 'http://ventusapi.herokuapp.com/api/user';
    Map<String, String> headers = {"Authorization": "Bearer " + prefs.getString('token')};
    String json = '';
    Response response = await post(url, headers: headers, body: json);
    Map resp = jsonDecode(response.body.toString());
    print(prefs.getString('token'));
    setState(() {
      name = resp['first_name'].toString();
      city = resp['location'].toString();
    });
  }

  Future<List<UserPODO>> _getUsers()  async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String url = "http://ventusapi.herokuapp.com/api/user/recommendations";
    Map<String, String> headers = {"Authorization": "Bearer " + pre.getString('token')};
    Response response = await get(url, headers: headers);
    print("responding");
    String json = response.body.toString();
    final jsonResponse = jsonDecode(json);
    var list = jsonResponse as List;
    print(list.length);
    List<UserPODO> users =  list.map((i) => UserPODO.fromJson(i)).toList();
    return users;
  }
  SharedPreferences prefs;
  @protected
  @mustCallSuper
  void initState() {
    _getUser();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blue),
          backgroundColor: Color(0xfff0f0f0),
          title: Image.asset('assets/logo07.png', fit: BoxFit.cover, scale: 1.7,),
        centerTitle: true,
      ),
      body: Center(

        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                  return ColorLoader(
                    colors: colors,
                    duration: Duration(microseconds: 1200),
                  );;
    }       else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: (){
                          prefs.setInt("User", snapshot.data[index].id);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => User()
                          ));
                        },
                        child: Container(
                          width: 10,
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                offset: new Offset(2.0, 2.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      child: Icon(Icons.person, color: blue,),
                                      decoration: BoxDecoration(
                                          color: lightBlue,
                                          shape: BoxShape.circle
                                      ),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(snapshot.data[index].name, style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: 17),),
                                      SizedBox(height: 3,),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.pin_drop, color: blue, size: 10,),
                                          Text(snapshot.data[index].location, style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: 10),),
                                        ],
                                      )
                                    ],
                                  ),

                                ],
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LinearPercentIndicator(
                                    width: 160.0,
                                    lineHeight: 14.0,
                                    percent: 0/snapshot.data[index].match,
                                    backgroundColor: red,
                                    progressColor: red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),

                    );
                  }

                );
              }
          }
        ),
      ),
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
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Home()
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home, color: lightBlue, size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("HOME", style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Container(
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Category()
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.category, color: lightBlue, size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("CATEGORIES", style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Container(
                child: FlatButton(
                  onPressed: (){
                    prefs.setString('token', null);
                    prefs.setString("refresfToken", null);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => FirstScreen()
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app, color: lightBlue, size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("LOG OUT", style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

