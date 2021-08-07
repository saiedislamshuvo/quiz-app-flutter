import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/presentation/pages/splash_page.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart' as di;

void main() async {
  // runApp(MyApp());
  
  await di.init();
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelTestProvider>(create: (_) => ModelTestProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interview Task',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashPage()
    );
  }
}
