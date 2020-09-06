

class Personel{
  String id ;
  String title;
  String name ;
  String email;
  String telNo;
  String department;
  String manager;
  String sameManager;

  Personel(this.id,this.title,this.name,this.email,this.telNo,this.department,this.manager,this.sameManager);


  Personel.fromJson(Map json){

    id = json["id"].toString();
    title = json["title"].toString();
    name = json["name"].toString();
    email = json["email"].toString();
    telNo = json["telNo"].toString();
    department = json["department"].toString();
    manager = json["manager"].toString();
    sameManager = json["sameManager"].toString();

  }

}