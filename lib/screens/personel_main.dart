

import 'dart:convert';

import 'package:akilli_cagri/models/all_user_model.dart';
import 'package:akilli_cagri/models/api/all_user_api.dart';
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
  List<AllPersonel> allpersonel = List<AllPersonel>();

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

            waitingData(),
            Icon(Icons.directions_bike),
          ],

        ),
      ) ,
    );


  }

  waitingData() {

    AllUserApi.Alluser(personel.token).then((value){
      //var dataJson = json.decode(value.body);
      //var users =AllPersonel.fromJson(dataJson);
      Map<String, dynamic> user = jsonDecode(value.body);
      print('We sent the verification link to ${user['email']}.');


    });
     return  Text("aa");
  }
}