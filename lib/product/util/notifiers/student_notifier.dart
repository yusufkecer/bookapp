import 'package:bookapp/product/models/student.dart';
import 'package:bookapp/product/string_data/string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentNotifier with ChangeNotifier {
  List<Student> _students = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Student> get students => _students;

  CollectionReference studentsCollection = FirebaseFirestore.instance.collection('students');

  void addStudent(Student student) {
    _students.add(student);

    notifyListeners();
  }

  Future<Map<String, dynamic>> sendFirebaseStudent(Student student) async {
    DocumentReference data = await studentsCollection.add(student.toMap());
    if (data.id.isEmpty) {
      return {
        "message": StringData.studentAddError,
        "result": false,
      };
    }

    bool? studentNumber = _students.any((element) => element.studentNumber == student.studentNumber);
    if (studentNumber == true) {
      return {
        "message": StringData.studentNumberExist,
        "result": false,
      };
    }
    student.id = data.id;
    // addStudent(student);
    notifyListeners();
    return {
      "message": StringData.addSuccess,
      "result": true,
    };
  }

  Future<void> getFirebase() async {
    _isLoading = true;

    await studentsCollection.get().then((value) {
      if (value.docs.isEmpty) {
        _isLoading = false;
        return null;
      }
      _students = value.docs.map((e) => Student().fromMap(e.data() as Map<String, dynamic>)).toList();
      _isLoading = false;
    });
    notifyListeners();
  }
}
