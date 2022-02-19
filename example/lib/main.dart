import 'package:example/src/with_loader_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'With Loader Example',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Scaffold(body: WithLoaderExample()),
    );
  }
}
