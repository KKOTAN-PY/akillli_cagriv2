import 'dart:convert';

import 'package:akilli_cagri/data/dbHelper.dart';
import 'package:akilli_cagri/data/dcryptText.dart';
import 'package:akilli_cagri/models/all_user_model.dart';
import 'package:akilli_cagri/models/api/all_user_api.dart';
import 'package:akilli_cagri/models/personel_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PersonelMain extends StatefulWidget {
  Personel personel;
  PersonelMain(Personel this.personel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonelMain(personel);
  }
}

class _PersonelMain extends State {
  Personel personel;
  _PersonelMain(this.personel);
  List<AllPersonel> allpersonel = List<AllPersonel>();
  List<Widget> personelWidget = List<Widget>();
  List<AllPersonel> listAll = List<AllPersonel>();
  List<Widget> listWidget;
  int personelCount = 0;
  DbHelper db = DbHelper();
  Decrypt decrypt = Decrypt();

  // ignore: must_call_super
  void initState() {
    //waitingData();
    //getpp();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Personel Main"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(),
            onChanged: (text) {
              if (text.length > 3) {
                var result = db.getTodo(text).then((value) {
                  for (var i in value) {
                    var resut = AllPersonel.fromObje(i);
                    print(resut.telNo);
                    this.listAll.add(resut);
                  }
                  widgetPersonel();
                });
              } else {
                listAll.clear();
                setState(() {
                  personelWidget.clear();
                });
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: personelWidget.reversed.toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  waitingData() {
    AllUserApi.Alluser(personel.token).then((value) {
      List user = jsonDecode(value.body) as List;
      Iterable list = user;

      setState(() {
        this.allpersonel =
            list.map((pers) => AllPersonel.fromJson(pers)).toList();
        print(allpersonel);
        getPersonelWidget();
      });
    });
  }

  void getPersonelWidget() async {
    for (var i in this.allpersonel) {
      print(i.name);
      var result = await db.inSert(i);
    }
  }

  void getpp() {
    var aaa = db.getPersonel();
    aaa.then((value) {
      for (var i in value) {
        print(i.name);
      }
    });
  }

  List<Widget> widgetPersonel() {
    for (int i = 0; i < this.listAll.length; i++) {
      setState(() {
        personelWidget.add(widgetPersonels(this.listAll[i]));
      });
    }
    return personelWidget;
  }

  Widget widgetPersonels(AllPersonel listAll) {
    return ListTile(
      title: Text(listAll.name),
      subtitle: Text(listAll.email),
      onTap: (){
        print(listAll.name);
      },
    );
  }
}
