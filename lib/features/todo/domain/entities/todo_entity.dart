class TodoList {
  int id;
  bool isCompleted;
  String title;

  TodoList({required this.id, required this.isCompleted, required this.title});

  TodoList copyWith({
    bool? isCompleted,
    String? title,
  }) {
    return TodoList(
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
      id: id,
    );
  }
}

class UniqueID {
  static int uuid() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}

class TodoStatics {
  static List<String> todos = [
    "Create animated text using font variations and animations",
    "Load the TODOs list from firebase"
  ];
  static List<bool> todosIsCompleted = [false, false];
}
