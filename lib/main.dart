import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/presentation/pages/splash_page.dart';

import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Task',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashPage()
    );
  }
}
