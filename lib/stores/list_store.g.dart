// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  Computed<bool> _$empitytextComputed;

  @override
  bool get empitytext => (_$empitytextComputed ??=
          Computed<bool>(() => super.empitytext, name: '_ListStore.empitytext'))
      .value;

  final _$newTextAtom = Atom(name: '_ListStore.newText');

  @override
  String get newText {
    _$newTextAtom.reportRead();
    return super.newText;
  }

  @override
  set newText(String value) {
    _$newTextAtom.reportWrite(value, super.newText, () {
      super.newText = value;
    });
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void setNewText(String value) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.setNewText');
    try {
      return super.setNewText(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add() {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.add');
    try {
      return super.add();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newText: ${newText},
empitytext: ${empitytext}
    ''';
  }
}
