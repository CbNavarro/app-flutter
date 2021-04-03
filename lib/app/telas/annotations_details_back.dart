import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:flutter/cupertino.dart';

class AnnotationsDetailsBack {
  BuildContext context;
  Annotations annotations;
  AnnotationsDetailsBack(this.context) {
    annotations = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
