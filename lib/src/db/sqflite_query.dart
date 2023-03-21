import 'package:flutter/material.dart';
import 'package:cursos/src/db/db_helpers.dart';
import 'package:cursos/src/models/usuario.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteQuery with ChangeNotifier {
  List<Usuario>? _usuarios;
  List<Usuario> get usuarios => [...?_usuarios];

  Future<void> updateUsuarios() async {
    final Database? db = await SQLiteHelper.getDB();
    final List<Map<String, dynamic>> maps = await db!.query("usuarios");
    _usuarios = List.generate(
      maps.length,
      (i) {
        return Usuario(
          id: maps[i]['id'],
          email: maps[i]['email'],
          contrasena: maps[i]['contrasena'],
        );
      },
    );
    notifyListeners();
  }
}
