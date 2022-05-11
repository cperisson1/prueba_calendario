import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';



class DbUtils {


  static Future upgradeDB () async{

    print('## realizando upgrade de la base de datos');

    await Future.delayed(const Duration(milliseconds: 1),);

    print('## upgrade realizado');
  }






  static Future copyDatabase(path, databaseFileName) async {
    // Copia base de datos de la carpeta Assets al directorio de la aplicacion en el dispotivo

    if (!databaseFileName.contains('.db')) {
      databaseFileName += '.db';
    }

    // Verifica si el directorio de destino existe
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copia la base de datos desde el directorio Assets

    ByteData data = await rootBundle.load(join("assets", databaseFileName));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Escribe el fichero en el destino

    print('## copia base de datos $path');
    await File(path).writeAsBytes(bytes, flush: true);
  }

}