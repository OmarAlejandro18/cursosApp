import 'package:cursos/src/db/db_helpers.dart';
import 'package:cursos/src/models/usuario.dart';
import 'package:sqflite/sqlite_api.dart';

class SqliteInsert {
  Future<void> usuario(Usuario usuario) async {
    final Database? db = await SQLiteHelper.getDB();
    await db!.insert(
      'usuarios',
      usuario.toMap(),
    );
  }
}
