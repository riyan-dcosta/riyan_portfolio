import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseDB extends ChangeNotifier{
  final db = FirebaseFirestore.instance;
}