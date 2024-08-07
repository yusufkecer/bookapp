import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/feature/view/student/student_add/student_add.dart';
import 'package:bookapp/product/models/student.dart';
import 'package:bookapp/product/string_data/string.dart';
import 'package:bookapp/product/util/notifiers/student_notifier.dart';
import 'package:bookapp/product/util/popup/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StudentAddModel extends ConsumerState<StudentAddView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      studentNotifier = ref.watch(MyNotifiers.instance.student);
    });

    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController number = TextEditingController();
  StudentNotifier? studentNotifier;
  Popup popup = Popup();

  void saveStudent() async {
    bool? result = await popup.confirmDialog(context, StringData.saveStudent);
    if (result == null || !result) {
      return;
    }
    //validation
    if (nameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        classController.text.isEmpty ||
        number.text.isEmpty) {
      popup.generalError(StringData.fillAllFields);
      return;
    }
    Map? res = await studentNotifier?.sendFirebaseStudent(
      Student(
        name: nameController.text,
        surname: surnameController.text,
        stundentClass: classController.text,
        studentNumber: number.text,
        receivedBooks: const [],
      ),
    );

    if (res == null && (res!["result"] == null || !res["result"])) {
      popup.generalError(StringData.saveError);
      return;
    } else {
      Future(() => Popup.generalSuccess(StringData.saveSuccess));
    }
  }
}
