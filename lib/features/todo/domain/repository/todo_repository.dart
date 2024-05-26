import 'package:riyan_portfolio/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoList>> getAllTodos();
}
