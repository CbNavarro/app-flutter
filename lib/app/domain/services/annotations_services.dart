import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:app_flutter/app/domain/exception/domain_layer_exception.dart';
import 'package:app_flutter/app/domain/interfaces/annotations_dao.dart';
import 'package:get_it/get_it.dart';

class AnnotationsServices {
  var _dao = GetIt.I.get<DAOAnnotations>();

  salvar(Annotations annotations) {
    validarTitulo(annotations.titulo);
    _dao.salvar(annotations);
  }

  remover(int id) {
    _dao.remover(id);
  }

  Future<List<Annotations>> buscar() {
    return _dao.buscar();
  }

  validarTitulo(String titulo) {
    var min = 3;
    var max = 50;

    if (titulo == null) {
      throw new DomainLayerException('Titulo e obrigatorio');
    } else if (titulo.length < min) {
      throw new DomainLayerException(
          'O titulo deve possuir pelo menos $min caracteres');
    } else if (titulo.length > max) {
      throw new DomainLayerException('O titulo e muito grande');
    }
  }
}
