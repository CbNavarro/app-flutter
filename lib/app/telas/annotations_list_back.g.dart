// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotations_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationsListBack on _AnnotationsListBack, Store {
  final _$listAtom = Atom(name: '_AnnotationsListBack.list');

  @override
  Future<List<Annotations>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Annotations>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_AnnotationsListBackActionController =
      ActionController(name: '_AnnotationsListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_AnnotationsListBackActionController.startAction(
        name: '_AnnotationsListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_AnnotationsListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
