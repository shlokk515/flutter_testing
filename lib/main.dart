import 'package:flutter/material.dart';
import 'package:helloworld/home_page.dart';
// import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Open the peopleBox
  await Hive.openBox('nameBox');
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const HomePage(),
      ),
    );
  }
}
