import 'package:bookapp/feature/view/student/student_add/student_add_model.dart';

import 'package:bookapp/core/radius/project_radius.dart';
import 'package:bookapp/product/string_data/string.dart';

import 'package:bookapp/product/widgets/buttons/confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentAddView extends ConsumerStatefulWidget {
  const StudentAddView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentAddViewState();
}

class _StudentAddViewState extends StudentAddModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringData.studentAdd),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.start,
                  StringData.studentInfo,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              space(),
              customTextField(nameController, StringData.studentName, StringData.studentNameHint),
              space(),
              customTextField(surnameController, StringData.studentSurname, StringData.studentSurnameHint),
              space(),
              customTextField(classController, StringData.studentClass, StringData.studentClassHint),
              space(),
              customTextField(number, StringData.studentNumber, StringData.studentNumberHint),
              space(),
              ConfirmButton(
                onPressed: saveStudent,
                text: StringData.save,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField customTextField(TextEditingController controller, String labelText, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: CustomRadius.ten(),
        ),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }

  SizedBox space() {
    return const SizedBox(
      height: 10,
    );
  }
}
