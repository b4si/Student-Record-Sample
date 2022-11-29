// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, no_leading_underscores_for_local_identifiers

import 'package:database_sample/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;
  // studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  // print(value.toString());
}

Future getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.delete(id);
  getAllStudents();
}

Future<void> updateStudent(int id, StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.putAt(id, value);
  getAllStudents();
}
