import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your login file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginApp(), // Use the login screen
    );
  }
}
