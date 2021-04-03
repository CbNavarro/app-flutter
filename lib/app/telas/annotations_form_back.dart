import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:app_flutter/app/domain/services/annotations_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'annotations_form_back.g.dart';

class AnnotationsFormBack = _AnnotationsFormBack with _$AnnotationsFormBack;

abstract class _AnnotationsFormBack with Store {
  Annotations annotations;
  var _service = GetIt.I.get<AnnotationsServices>();
  bool _isValid;

  bool get valido => _isValid;

  _AnnotationsFormBack(BuildContext context) {
    var parametros = ModalRoute.of(context).settings.arguments;

    annotations = (parametros == null) ? Annotations() : parametros;
  }

  salvar() async {
    await _service.salvar(annotations);
  }

  String validateCampo(String campo) {
    try {
      _service.validarTitulo(campo);
      _isValid = true;
      return null;
    } catch (e) {
      _isValid = false;
      return e.toString();
    }
  }
}
