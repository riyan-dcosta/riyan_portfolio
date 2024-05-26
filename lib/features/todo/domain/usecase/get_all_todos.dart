import 'package:riyan_portfolio/features/todo/domain/entities/todo_entity.dart';
import 'package:riyan_portfolio/features/todo/domain/repository/todo_repository.dart';

class GetAllTodos {
  final TodoRepository _todoRepository;

  GetAllTodos({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  Future<List<TodoList>>call() async {
    final list = await _todoRepository.getAllTodos();
    return list;
  }
}
