import 'package:app_flutter/app/database/sqlite/connection.dart';
import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:app_flutter/app/domain/interfaces/annotations_dao.dart';
import 'package:sqflite/sqflite.dart';

class ImplDaoAnnotations implements DAOAnnotations {
  Database _db;

  @override
  Future<List<Annotations>> buscar() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('annotations');
    List<Annotations> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Annotations(
        id: linha['id'],
        titulo: linha['titulo'],
        subtitulo: linha['subtitulo'],
        descricao: linha['descricao'],
      );
    });

    return lista;
  }

  @override
  remover(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM annotations WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  salvar(Annotations annotations) async {
    var sql;
    _db = await Connection.get();
    if (annotations.id == null) {
      sql =
          ' INSERT INTO annotations (titulo, subtitulo, descricao) VALUES (?,?,?)';
      _db.rawInsert(sql,
          [annotations.titulo, annotations.subtitulo, annotations.descricao]);
    } else {
      sql =
          ' UPDATE annotations SET titulo = ?, subtitulo = ?, descricao = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        annotations.titulo,
        annotations.subtitulo,
        annotations.descricao,
        annotations.id
      ]);
    }
  }
}
