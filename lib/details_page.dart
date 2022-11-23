import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final name;
  final age;
  final place;
  final number;
  const DetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.place,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('details'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Name: $name',
                style: const TextStyle(fontSize: 30, color: Colors.redAccent),
              ),
              Text(
                'Age: $age ',
                style: const TextStyle(fontSize: 30, color: Colors.redAccent),
              ),
              Text(
                'Place: $place',
                style: const TextStyle(fontSize: 30, color: Colors.redAccent),
              ),
              Text(
                'Number: $number',
                style: const TextStyle(fontSize: 30, color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
