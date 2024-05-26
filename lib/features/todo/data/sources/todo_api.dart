import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riyan_portfolio/controller/firebase_db.dart';
import 'package:riyan_portfolio/features/todo/domain/entities/todo_entity.dart';

abstract class TodoApi {
  Future<List<TodoList>> loadTodos();
}

class TodoApiFirebaseImpl implements TodoApi {
  @override
  Future<List<TodoList>> loadTodos() async {
    List<TodoList> returnList = [];
    try {
      final db = FirebaseDB().db;
      final todoCollectionRef = db.collection("todo-list");
      final todoDocRef = await todoCollectionRef.get();
      int docsLength = todoDocRef.docs.length;
      List<DocumentSnapshot<Map<String, dynamic>>> todosList = [];
      for (int i = 0; i < docsLength; i++) {
        final document = await todoDocRef.docs[i].reference.get();
        Map<String, dynamic> docInfo = {"id": todoDocRef.docs[i].id};
        docInfo.addAll(document.data() ?? {});
        print("docInfo ${TodoList.fromJson(docInfo).toString()}");
        returnList.add(TodoList.fromJson(docInfo));
      }
      return returnList;
    } on Exception catch (e) {
      print("todoImple $e");
    }
    return [];
  }
}
