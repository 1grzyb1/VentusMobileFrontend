import 'package:flutter/material.dart';
import 'package:ventus/main.dart';

import 'category.dart';

class Home extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<Home> {
  Color blue = Color(0xff517193);
  Color lightBlue = Color(0xff91a5bb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blue),
          backgroundColor: Color(0xfff0f0f0),
          title: Image.asset('assets/logo07.png', fit: BoxFit.cover, scale: 1.7,),
        centerTitle: true,
      ),
      body: Center(),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: blue, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
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

