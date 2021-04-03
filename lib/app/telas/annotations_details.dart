import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:app_flutter/app/telas/annotations_details_back.dart';
import 'package:flutter/material.dart';

class AnnotationsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = AnnotationsDetailsBack(context);
    Annotations annotations = _back.annotations;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var width = constraints.biggest.width;
      var height = constraints.biggest.height;

      return Scaffold(
        body: ListView(
          children: [
            Center(
              child: Text(
                '${annotations.titulo}',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Center(
              child: Text(
                '${annotations.subtitulo}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text('${annotations.descricao}'),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            _back.goToBack();
          },
        ),
      );
    });
  }
}
