import 'dart:async';

import 'package:akilli_cagri/models/all_user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  Database _db;

  Future<Database> get db async {
    if (_db == null){
      _db = await initalizeDb();
    }
    return _db;
  }

  Future<Database> initalizeDb() async {
    String dbPath = join( await getDatabasesPath(),"eTradeDb");
    var eTradeDb = await openDatabase(dbPath,version: 1,onCreate: cradeDb);
    return eTradeDb;

  }

  void cradeDb(Database db, int version) async{

    db.execute("create table personelTable(idRow integer primary key  Autoincrement,id text,title text,name text,email text,telNo text,department text,manager text,sameManager text,thumbnailPhoto text,bos text) ");
  }


Future<List<AllPersonel>> getPersonel() async{

  Database db = await this.db;
  var result = await db.query("personelTable");

  return List.generate(result.length, (i){
    print(result[i]);
    return AllPersonel.fromObje(result[i]);
  });
}
  Future<int> inSert (AllPersonel allPersonel)async{

    Database db = await this.db;
    var result = await db.insert("personelTable",allPersonel.allPersonelMap(),conflictAlgorithm: ConflictAlgorithm.replace);



  }

  Future getTodo(var id) async {

    Database db = await this.db;
    List<Map> maps = await db.query("personelTable",
        columns: ["idRow", "id", "title","name","email","telNo","department","manager","sameManager"],
        where: "name LIKE '%$id%'",
    );if (maps.length > 0) {

          return maps;

        }



    }





}
//"thumbnailPhoto"
