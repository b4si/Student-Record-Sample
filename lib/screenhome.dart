// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:database_sample/db/functions.dart';
import 'package:database_sample/list_student_widget.dart';
import 'package:database_sample/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Screenhome extends StatelessWidget {
  Screenhome({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _placeController = TextEditingController();
  final _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _placeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Place',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Number',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                addStudentButtonClicked().whenComplete(
                  () => fieldClear(),
                );
              },
              child: const Text('Add'),
            ),
            const Expanded(child: ListStudentWidget()),
          ],
        ),
      ),
    );
  }

  Future<void> addStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _place = _placeController.text.trim();
    final _number = _numberController.text.trim();
    if (_name.isEmpty || _age.isEmpty || _place.isEmpty || _number.isEmpty) {
      return;
    } else {
      // print('$_name $_age $_place $_number');

      final _student = StudentModel(
        name: _name,
        age: _age,
        place: _place,
        number: _number,
      );
      addStudent(_student);
    }
  }

  Future<void> fieldClear() async {
    _ageController.clear();
    _nameController.clear();
    _numberController.clear();
    _placeController.clear();
  }
}
