// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:database_sample/db/functions.dart';
import 'package:database_sample/model/data_model.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final int id;
  final String name;
  final String age;
  final String place;
  final String number;
  final int index;
  EditPage({
    super.key,
    required this.name,
    required this.age,
    required this.place,
    required this.number,
    required this.index,
    required this.id,
  });

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _placeController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = name;
    _ageController.text = age;
    _placeController.text = place;
    _numberController.text = number;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
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
                final String _name = _nameController.text;
                final String _age = _ageController.text;
                final String _place = _placeController.text;
                final String _number = _numberController.text;
                final _result = StudentModel(
                    id: id,
                    name: _name,
                    age: _age,
                    place: _place,
                    number: _number);

                updateStudent(id, _result)
                    .whenComplete(() => Navigator.of(context).pop());
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
