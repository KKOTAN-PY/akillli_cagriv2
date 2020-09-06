import 'package:encryptblowfish/encryptblowfish.dart';
class LoginModel{

  String id;
  String password ;
  bool durum;
  LoginModel();
  LoginModel.whit(this.id,this.password);


// Platform messages are asynchronous, so we initialize in an async method.

  Map toJson(){
    return {"id":id,"password":password};
  }



}