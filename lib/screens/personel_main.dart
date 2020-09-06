

import 'package:akilli_cagri/models/personel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PersonelMain extends StatefulWidget{
  Personel personel;
  PersonelMain(Personel this.personel);




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonelMain(personel);
  }

}

class _PersonelMain extends State{
  Personel personel;
  _PersonelMain(this.personel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child:Scaffold(
        appBar: AppBar(
          title: Text("Personel Main"),
          bottom:TabBar(
            tabs: [
              Tab(icon: Icon(Icons.perm_identity)),
              Tab(icon: Icon(Icons.people)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    radius: 50.0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Müdürlük :"+" "+personel.department),
                          Text("title :"+" "+personel.title),
                          Text("İsim :"+" "+personel.name),
                          Text("Telefon :"+" "+personel.telNo),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.people),
            Icon(Icons.directions_bike),
          ],

        ),
      ) ,
    );


  }
}