import 'package:akilli_cagri/data/dcryptText.dart';

class AllPersonel{
  Decrypt decrypt = Decrypt();

  int idRow;
  String id ;
  String title;
  String name ;
  String email;
  String telNo;
  String department;
  String manager;
  String sameManager;
  String thumbnailPhoto;
  AllPersonel(this.id,this.title,this.name,this.email,this.telNo,this.department,this.manager,this.sameManager,this.thumbnailPhoto);


  AllPersonel.fromJson(Map json){

    id = json["id"].toString();
    title = json["title"].toString();
    name = json["name"].toString();
    email = json["email"].toString();
    telNo = json["telNo"].toString();
    department = json["department"].toString();
    manager = json["manager"].toString();
    sameManager = json["sameManager"].toString();
    thumbnailPhoto = json["thumbnailPhoto"].toString();
  }

    Map<String,dynamic > allPersonelMap() {

    var map =Map<String,dynamic>();
    map["idRow"] =this.idRow;
    map["id"] =this.id.toString();
    map["title"] =this.title.toString();
    map["name"] =this.name.toString();
    map["email"] =this.email.toString();
    map["telNo"] =this.telNo.toString();
    map["department"] =this.department.toString();
    map["manager"] =this.manager.toString();
    map["sameManager"] =this.sameManager.toString();
    map["thumbnailPhoto"] =this.thumbnailPhoto.toString();

    if (id != null) {
      map["idRow"] = idRow;
    }
    return map;
  }

  AllPersonel.fromObje(dynamic o){
    this.idRow=o["idRow"];
    this.id=o["id"];
    this.title=o["title"];
    this.name=o["name"];
    this.email=o["email"];
    this.telNo=o["telNo"];
    this.department=o["department"];
    this.manager=o["manager"];
    this.sameManager=o["sameManager"];
    this.thumbnailPhoto=o["thumbnailPhoto"];
  }
}