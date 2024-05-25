import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/todo_entity.dart';

class TodoMutableList extends ChangeNotifier {
  final List<TodoList> _todos = [];

  UnmodifiableListView<TodoList> get getTodos => UnmodifiableListView(_todos);

  loadList() {
    final todosLength = TodoStatics.todos.length;
    for (int i = 0; i < todosLength; i++) {
      _todos.add(
        TodoList(
          isCompleted: TodoStatics.todosIsCompleted[i],
          title: TodoStatics.todos[i],
          id: i,
        ),
      );
    }
    notifyListeners();
  }

  updateTodo({required int id}) {
    TodoList todoElement = _todos.singleWhere((element) => element.id == id);
    int todoIndex = _todos.indexOf(todoElement);
    _todos[todoIndex].isCompleted = !todoElement.isCompleted;
    notifyListeners();
  }
}
