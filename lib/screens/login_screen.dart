

import 'dart:convert';


import 'package:akilli_cagri/data/dbHelper.dart';
import 'package:akilli_cagri/models/api/login_api.dart';
import 'package:akilli_cagri/models/login/modellogin.dart';
import 'package:akilli_cagri/models/login/sifreleme.dart';
import 'package:akilli_cagri/models/personel_model.dart';
import 'package:akilli_cagri/screens/verification_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }

}

class _LoginScreen extends State{
  var loginmodel = LoginModel();
  Encrypt encrypt =Encrypt();
  LoginApi loginApi = new LoginApi();
  DbHelper db = DbHelper();
  String encrypt_id = "";
  String encrypt_passwd = "";
  TextEditingController id = TextEditingController();
  TextEditingController paswd = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    db.initalizeDb();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekranı"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0,top: 75.0),
        child: Column(
          children: [
            sicil(),
            passwordd(),
            loginButton()
          ],
        ),
      ),
    );
  }

 Widget sicil() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Sicil No",
      ),
      controller: id,
    );
 }

 Widget passwordd() {
    return TextFormField(
        decoration: InputDecoration(
        labelText: "Password",

    ),

   controller: paswd,
   );
 }

  Widget loginButton() {
    return RaisedButton(
      child: Text("Giriş"),
      onPressed:(){
        loginOnline();


      } ,
    );
  }

   loginOnline() {
    var son= encrypt.blowFishEncrypt(id.text);
    son.then((value) {

      this.encrypt_id = value;
      var son1= encrypt.blowFishEncrypt(paswd.text);
      son1.then((value) {

        this.encrypt_passwd = value;
        loginOl();
      });
    });

    loginmodel.id= id.text;
    loginmodel.password= paswd.text;

    

  }

  void loginOl() {

    var log =LoginApi.login(encrypt_id.trim(),encrypt_passwd.trim());
    log.then((value){
      print("burası");
      var onay  =json.decode(value.body.toString());
      print(onay);
      if (onay == true){

        var result =Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VerificationScreen(id.text)));
        print(id.text);

      }
    });

  }


}