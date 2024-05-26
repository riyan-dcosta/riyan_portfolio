import 'package:riyan_portfolio/features/todo/data/sources/todo_api.dart';
import 'package:riyan_portfolio/features/todo/domain/entities/todo_entity.dart';
import 'package:riyan_portfolio/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository{

  final TodoApi todoApi;

  TodoRepositoryImpl({required this.todoApi});
  @override
  Future<List<TodoList>> getAllTodos() {
    final fetchedList = todoApi.loadTodos();
    return fetchedList;
  }

}