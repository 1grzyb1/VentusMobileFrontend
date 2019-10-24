import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventus/User.dart';

import 'category.dart';

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
  SharedPreferences prefs;
  inintShared() async{
     prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    inintShared();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blue),
          backgroundColor: Color(0xfff0f0f0),
          title: Image.asset('assets/logo07.png', fit: BoxFit.cover, scale: 1.7,),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: (){
                  prefs.setString("User", "s");
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
                                Text("Piast Bulgocki", style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: 17),),
                                SizedBox(height: 3,),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.pin_drop, color: blue, size: 10,),
                                    Text("Góry Sowie", style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: 10),),
                                  ],
                                )
                              ],
                            )
                        ],
                      ),
                      Table(
                        columnWidths: {1: FractionColumnWidth(.6)},
                        children: [
                          TableRow( children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text("Linkin Park", style: TextStyle(color: blue, fontWeight: FontWeight.bold),),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 1,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text("glebogryzarki", style: TextStyle(color: blue, fontWeight: FontWeight.bold),),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.8,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text("Majkarft Bomba", style: TextStyle(color: blue, fontWeight: FontWeight.bold),),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.6,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text("pomidory", style: TextStyle(color: blue, fontWeight: FontWeight.bold),),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.2,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ),
          ],
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
                             child: Text("Łukasz Stanisławowski", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(20, 3, 0, 0),
                               child: Text("Drogosławiec, Stęszew", style: TextStyle(fontSize: 10, color: Colors.white),),
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
                        child: Text("HOME", style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new Home();
                    }));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person, color: lightBlue, size: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("PROFILE", style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Container(
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
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new Category();
                    }));
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

