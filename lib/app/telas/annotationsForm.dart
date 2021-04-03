import 'package:app_flutter/app/telas/annotations_form_back.dart';
import 'package:flutter/material.dart';

class AnnotationsForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget titulo(AnnotationsFormBack back) {
    return TextFormField(
      validator: back.validateCampo,
      onSaved: (newValue) => back.annotations.titulo = newValue,
      initialValue: back.annotations.titulo,
      decoration: InputDecoration(labelText: 'Titulo'),
    );
  }

  Widget subtitulo(AnnotationsFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.annotations.subtitulo = newValue,
      initialValue: back.annotations.subtitulo,
      decoration: InputDecoration(labelText: 'Subtitulo'),
    );
  }

  Widget descricao(AnnotationsFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.annotations.descricao = newValue,
      initialValue: back.annotations.descricao,
      maxLines: 8,
      decoration: InputDecoration(labelText: 'Descricao'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = AnnotationsFormBack(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Anotacao'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.valido) {
                  _back.salvar();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
              children: [
                titulo(_back),
                subtitulo(_back),
                descricao(_back),
              ],
            )),
      ),
    );
  }
}
