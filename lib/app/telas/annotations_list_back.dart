import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:app_flutter/app/domain/services/annotations_services.dart';
import 'package:app_flutter/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'annotations_list_back.g.dart';

class AnnotationsListBack = _AnnotationsListBack with _$AnnotationsListBack;

abstract class _AnnotationsListBack with Store {
  var _service = GetIt.I.get<AnnotationsServices>();
  //Lista de anotacoes
  @observable
  Future<List<Annotations>> list;
  // Manter atualizado
  @action
  refreshList([dynamic value]) {
    list = _service.buscar();
  }

  _AnnotationsListBack() {
    refreshList();
  }
  // Metodo para chamar Form salvar/alterar
  goToForm(BuildContext context, [Annotations annotations]) {
    Navigator.of(context)
        .pushNamed(MyApp.ANNOTATIONSFORM, arguments: annotations)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Annotations annotations) {
    Navigator.of(context)
        .pushNamed(MyApp.ANNOTATIONSDETAILS, arguments: annotations);
  }

  // Excluir
  remover(int id) {
    _service.remover(id);
    refreshList();
  }
}
