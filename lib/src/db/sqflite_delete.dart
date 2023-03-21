import 'package:cursos/src/db/db_helpers.dart';
import 'package:cursos/src/models/usuario.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDelete {
  Future<void> usuario(Usuario usuario) async {
    final Database? db = await SQLiteHelper.getDB();
    await db!.delete('usuarios', where: 'id=?', whereArgs: [usuario.id]);
  }
}
