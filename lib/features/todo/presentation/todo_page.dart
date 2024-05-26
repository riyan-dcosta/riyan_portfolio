import 'package:flutter/material.dart';
import 'package:riyan_portfolio/features/todo/data/repository/todo_repo_impl.dart';
import 'package:riyan_portfolio/features/todo/data/sources/todo_api.dart';
import 'package:riyan_portfolio/features/todo/domain/usecase/get_all_todos.dart';
import 'package:riyan_portfolio/features/todo/presentation/controllers/todo_list_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TodoMutableList todoMutableList = TodoMutableList(
      getAllTodos:
          GetAllTodos(todoRepository: TodoRepositoryImpl(todoApi: TodoApiFirebaseImpl())));

  @override
  void initState() {
    super.initState();
    // initializeTodos();
  }

  initializeTodos() {
    todoMutableList.loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              print("load todos");
              initializeTodos();
            },
            child: Text("load Todoas")),
        ListenableBuilder(
          listenable: todoMutableList,
          builder: (context, child) {
            final todos = todoMutableList.getTodos;
            return Column(
              children: todos
                  .map((e) => Row(
                        children: [
                          Checkbox(
                              value: e.isCompleted,
                              onChanged: (_) {
                                todoMutableList.updateTodo(id: e.id);
                              }),
                          Text(e.title),
                        ],
                      ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
