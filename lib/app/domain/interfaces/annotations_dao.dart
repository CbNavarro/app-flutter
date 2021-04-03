import 'package:app_flutter/app/domain/entidades/annotations.dart';

abstract class DAOAnnotations {
  salvar(Annotations annotations);

  remover(int id);

  Future<List<Annotations>> buscar();
}
