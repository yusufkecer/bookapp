import 'package:bookapp/product/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentNotifier with ChangeNotifier {
  List<Student> _students = [];

  List<Student> get students => _students;

  CollectionReference studentsCollection = FirebaseFirestore.instance.collection('students');

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  Future<void> sendFirebase(Student student) async {
    await studentsCollection.add(student.toMap());
  }
}
