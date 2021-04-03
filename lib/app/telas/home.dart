import 'package:app_flutter/app/domain/entidades/annotations.dart';
import 'package:app_flutter/app/my_app.dart';
import 'package:app_flutter/app/telas/annotations_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatelessWidget {
  final _back = AnnotationsListBack();

  Widget botaoEditar(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.green, onPressed: onPressed);
  }

  Widget botaoExcluir(BuildContext context, Function onPressed) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirmar exclusao? '),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Nao')),
                      FlatButton(onPressed: onPressed, child: Text('Sim'))
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Anotacoes'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Navigator.of(context).pushNamed(MyApp.ANNOTATIONSFORM);
                  _back.goToForm(context);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) return CircularProgressIndicator();

                List<Annotations> lista = futuro.data;
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var anotacao = lista[i];
                    return ListTile(
                      onTap: () {
                        _back.goToDetails(context, anotacao);
                      },
                      title: Text(anotacao.titulo),
                      subtitle: Text(anotacao.subtitulo),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            botaoEditar(() {
                              _back.goToForm(context, anotacao);
                            }),
                            botaoExcluir(context, () {
                              _back.remover(anotacao.id);
                              Navigator.of(context).pop();
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
        }));
  }
}
