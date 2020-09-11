import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/to_do_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {

  @observable
  String newText = "";

  @action
  void setNewText(String value) => newText = value;

  @computed
  bool get empitytext => newText.isNotEmpty;


  ObservableList<ToDoStore> list = ObservableList<ToDoStore>();

  @action
  void add() {
    list.insert(0, ToDoStore(newText));
    newText = "";
    print(list);
  }
}