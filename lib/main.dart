import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_manager.dart'; // Your theme manager file
import 'login_screen.dart'; // Your login screen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(), // Provide theme manager globally
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode:
          ThemeMode
              .light, // Always light at root; dark mode only on selected screens
      home: LoginApp(),
    );
  }
}
