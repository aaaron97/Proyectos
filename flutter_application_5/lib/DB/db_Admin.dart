
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin{
  Database? myDatabase;

  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  checkDatabase(){
   if(myDatabase != null){
    return myDatabase;
   }
   myDatabase =
   return myDatabase;
  }

  initDatabase() async{
   Directory directory = await getApplicationDocumentsDirectory();
   String path = join(directory.path,"TaskDB.db");
   await openDatabase(
    path,
    version: 1,
    onOpen: (db){},
    onCreate: (Database dbx, int version){
      dbx.execute("CREATE TABLE TASK (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description) ");
    }
   );
  }
}