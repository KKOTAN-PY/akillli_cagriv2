import 'package:encryptblowfish/encryptblowfish.dart';
class LoginModel{

  String id;
  String password ;

  LoginModel();
  LoginModel.whit(this.id,this.password);


  Map toJson(){
    return {"id":id,"password":password};
  }



}