import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ventus/PODO/SelfUserPODO.dart';
import 'package:ventus/laoder/ColorLoader.dart';

import 'Home.dart';
import 'PODO/SubcategoryPODO.dart';
import 'PODO/UserPODO.dart';
import 'category.dart';
import 'main.dart';

class User extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<User> {

  String link = "";

  Future<SelfUserPODO> _getUser() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String url = "http://ventusapi.herokuapp.com/api/user/" +
        pre.getInt('User').toString();
    Map<String, String> headers = {
      "Authorization": "Bearer " + pre.getString('token')
    };
    Response response = await get(url, headers: headers);
    print("responding");
    String json = response.body.toString();
    final jsonResponse = jsonDecode(json);
    SelfUserPODO users = SelfUserPODO.fromJson(jsonResponse);
    setState(() {
      link = users.messenger;
    });
    return users;
  }

  String name = "";
  String city = "";
  Color blue = Color(0xff517193);
  Color lightBlue = Color(0xff91a5bb);
  Color green = Color(0xff46B29D);
  Color red = Color(0xffFFAD6F);
  Color orange = Color(0xffFEB74E);
  List<Color> colors = [
    Colors.red,
  ];
  SharedPreferences prefs;
  _getUsero() async {
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

  @protected
  @mustCallSuper
  void initState() {
    _getUsero();
  }


  @override
  Widget build(BuildContext context) {
    _getUser();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: blue),
          backgroundColor: Color(0xfff0f0f0),
          title: Image.asset(
            'assets/logo07.png',
            fit: BoxFit.cover,
            scale: 1.7,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: _getUser(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                                if(snapshot.data == null){
                                  return ColorLoader(
                                    colors: colors,
                                    duration: Duration(microseconds: 1200),
                                  );
                                }
                                else{
                                  return Column(children: <Widget>[
                                    Container(
                                      height: 60,
                                      width: 60,
                                      child: Icon(
                                        Icons.person,
                                        color: blue,
                                      ),
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: lightBlue,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        snapshot.data.name,
                                        style: TextStyle(
                                            color: blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        snapshot.data.location,
                                        style: TextStyle(color: blue, fontSize: 10),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 2.0),
                                                  child: Text(
                                                    snapshot.data.birthday,
                                                    style: TextStyle(
                                                      color: blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 8.0),
                                                    child: Text(
                                                      "Age",
                                                      style: TextStyle(
                                                          color: blue,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.bold),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.fromLTRB(0, 20, 30, 0),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 3.0),
                                                  child: Text(
                                                    snapshot.data.match.toString() + "%",
                                                    style: TextStyle(
                                                      color: blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    "Match",
                                                    style: TextStyle(
                                                        color: blue,
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ],);
                                }
                            },
                      ),

                    ],
                  ),
                ),
              ],
            ),
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
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 3, 0, 0),
                                  child: Text(
                                    city,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
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
        bottomNavigationBar: BottomAppBar(
          color: blue,
          child: Container(
            height: 50,
            child: FlatButton(
                onPressed: () async {
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                }
                ,
                child: Text(
                  "Send Invitation",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
        ));
  }
}
