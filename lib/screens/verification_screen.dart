

import 'dart:convert';

import 'package:akilli_cagri/models/api/verification_api.dart';
import 'package:akilli_cagri/models/personel_model.dart';
import 'package:akilli_cagri/screens/personel_main.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget{
  String id ;
  VerificationScreen(String id){
    this.id = id;

  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _verificationScreen (id);
  }

}

class _verificationScreen extends State {
  List<Personel> personel = List<Personel>();
  TextEditingController verificationCode = TextEditingController();
  String id ;
  _verificationScreen(this.id);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Doğrulama Ekranı"),
      ),

      body: Container(
        padding: EdgeInsets.only(left: 20.0,top: 100.0),
        child: Column(
          children: [
            verificationInput(),

            verificationButton()
          ],
        ),
      ),
    );
  }

 Widget verificationInput() {

     return TextFormField(
       decoration: InputDecoration(
         labelText: "Doğrulama Kodu",
       ),
       controller: verificationCode,

     );

}

  verificationButton() {
    return RaisedButton(
      child: Text("Onayla"),
      onPressed:(){

         var onay = VerificationApi.Verification(id, verificationCode.text);
         onay.then((value) {
           var onayli  =json.decode(value.body);

           String ok = onayli["id"];
           if (ok ==id.trim()){
             print(onayli["id"]);
             print("tamadır");
             var pers = Personel.fromJson(onayli);



             //Iterable list =json.decode(value.body);
             //this.personel = list.map((personell) => Personel.fromJson(personell)).toList() ;
             var result =Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PersonelMain(pers)));

           }else{
             print("Doğrulama Kodu Yanlış");
             Navigator.pop(context);
           }

         });


      } ,
    );
  }
}
