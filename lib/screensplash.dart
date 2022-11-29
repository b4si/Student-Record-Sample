// ignore_for_file: use_build_context_synchronously

import 'package:database_sample/screenhome.dart';
import 'package:flutter/material.dart';

class Screensplash extends StatefulWidget {
  const Screensplash({Key? key}) : super(key: key);

  @override
  State<Screensplash> createState() => _ScreensplashState();
}

class _ScreensplashState extends State<Screensplash> {
  @override
  void initState() {
    goToHomepage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Student Record',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> goToHomepage() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenHome(),
      ),
    );
  }
}
