class TodoList {
  String id;
  bool isCompleted;
  String title;

  TodoList({required this.id, required this.isCompleted, required this.title});

  factory TodoList.fromJson(Map<String, dynamic> json) {
    return TodoList(
      id: json["id"],
      isCompleted: json["isCompleted"] ?? false,
      title: json["title"] ?? "N/A",
    );
  }

  @override
  String toString() {
    return "id : $id, titile : $title, isCompleted : $isCompleted";
  }

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

class TodoStatics {
  static List<String> todos = [
    "Create animated text using font variations and animations",
    "Load the TODOs list from firebase"
  ];
  static List<bool> todosIsCompleted = [false, false];
}
