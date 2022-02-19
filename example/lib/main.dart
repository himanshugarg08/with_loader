import 'package:example/backend_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:with_loader/with_loader.dart';

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
      home: Scaffold(
          body: Center(
        child: WithLoader<String>(
          future: apiCall,
          successCondition: (result) => result == "Success",
          loaderAlignment: Alignment.center,
          onSuccess: () {
            if (kDebugMode) {
              print("Api Success");
            }
          },
          onFailure: () {
            if (kDebugMode) {
              print("Api Failure");
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple.shade400,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16.0,
              ),
              child: Text(
                "Button",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          loader: CircularProgressIndicator(
            color: Colors.purple.shade600,
          ),
        ),
      )),
    );
  }
}
