
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/calendar_model.dart';
import 'db_utils.dart';

//sequentias

// Provider de la base de datos cim. fichero cim.db 


class CimDB with ChangeNotifier {
  static Database? _database;


  static final CimDB db = CimDB._();

  CimDB._();

  // miembros estaticos, disponibles desde la clase sin instancia
  
  static Meeting? selectedMeeting;

  // no se usa el constructor
  CimDB() {
      //print("## constructor vacio")
  }



  Future<Database?> get database async {
    // Singleton, para que este disponible la misma instancia desde cualquier punto de la aplicacion

    // * no se invoca hasta que no se necesita

    // Si no es la primera vez, devuelve instancia ya creada
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {
      //INICIALIZACION DE LA BASE DE DATOS

      final path = await getDbPath();

      print("## inicializada base de datos $path");


      var exists = await databaseExists(path);

      // ! temporalmente, siempre actualiza la base de datos. Se pierden los cambio del usuario
      if (exists) {
        print('## fichero base de datos cim.db no encontrado, se invoca copiado inicial');
        await DbUtils.copyDatabase(path, 'cim');
      } 

      _database = await openDatabase(
        path,
        version:
            1, // si el numero es igual del existente, abre. Si es mayor, CREA NUEVA
      );

      return _database;
  }


  Future<String> getDbPath() async {
    // Devuelve el path completo del archivo de base de datos

    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); // lo obtiene desde pluggin pathProvider
    return join(documentsDirectory.path, 'cim.db');
    
  }

  Future<List<Meeting>> getMeetings() async {

    final Database? db = await database;

    String sqlSentence = 'SELECT * FROM meetings';

    final queryResponse = await db!.rawQuery(sqlSentence);

    List<Meeting> meetingList = queryResponse.isNotEmpty
        ? queryResponse.map((s) => Meeting.fromMap(s)).toList()
        : [];

    return meetingList;
  }

}